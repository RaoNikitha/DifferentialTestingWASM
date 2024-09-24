;; 10. **Test for Type Enforcement in ‘call’ Instruction with Return**: Design a scenario where a called function's expected return type (`i32`) conflicts with the actual type (`f64`) provided by a `return` in the called function. The test checks if the calling context correctly enforces the return type constraints.

(assert_invalid
  (module
    (func $callee (result f64)
      (f64.const 0.0)
      (return)
    )
    (func $caller
      (call $callee)
      (return)
    )
  )
  "type mismatch"
)