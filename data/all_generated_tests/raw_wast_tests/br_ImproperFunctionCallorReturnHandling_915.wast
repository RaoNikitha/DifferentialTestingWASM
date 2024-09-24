;; 6. Test Description: Create an indirect function table setup where a `br` instruction mistakenly branches out of a loop controlling `call_indirect` operations leading to a type mismatch in function calls.

(assert_invalid
  (module
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (type (func (result i32)))
    (func $func (result i32) 
      (i32.const 1))
    (func (param i32) (result i32)
      (loop (result i32) 
        (block (result i32) 
          (call_indirect (type 0) (local.get 0)) 
          (br 1)))
    )
  )
  "type mismatch"
)