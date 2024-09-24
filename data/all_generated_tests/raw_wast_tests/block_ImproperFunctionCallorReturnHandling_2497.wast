;; A `block` instruction calls a function using a `call_indirect` instruction, and the called function performs another `call_indirect` in a further nested `block`. This checks if indirect calls handled within nested contexts result in correct function calls and returns.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $callee (type $sig) (i32.const 42))
    (func $caller (type $sig)
      (block (result i32)
        (call_indirect (type $sig) (i32.const 0))
        (block (result i32)
          (call_indirect (type $sig) (i32.const 0))
        )
      )
    )
    (start $caller)
  )
  "type mismatch"
)