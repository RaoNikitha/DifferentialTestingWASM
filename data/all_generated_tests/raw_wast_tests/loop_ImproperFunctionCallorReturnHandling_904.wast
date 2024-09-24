;; - Design a test with a `loop` containing a `call_indirect` within a `br_if` condition, aiming to branch based on a function’s computed index. Ensure correct type checking and function targets, verifying proper context extension.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $sig)
    (func
      (loop (result i32)
        (call_indirect (type $sig) (i32.const 0) (i32.const 42))
        (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)