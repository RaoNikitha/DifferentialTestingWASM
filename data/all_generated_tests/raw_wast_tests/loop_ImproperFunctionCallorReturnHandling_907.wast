;; - Implement a deeply nested `loop` with an embedded `call_indirect`, ensuring that proper type-checking handles multiple instruction layers. Validate that incorrect table indices are caught and managed.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32))) 
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $callee (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1)))
    (func (result i32)
      (local i32)
      (i32.const 0)
      (loop (result i32)
        (i32.const 1)
        (call_indirect (type $sig) (i32.const 1))
        (br 0)
      )
    )
  )
  "type mismatch"
)