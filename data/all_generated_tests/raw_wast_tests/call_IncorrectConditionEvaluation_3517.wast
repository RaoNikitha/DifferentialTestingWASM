;; 6. Develop a function call sequence where each function pushes two values onto the stack. Use a `br_if` to conditionally pop only one or both values based on a condition. Incorrectly evaluated conditions should produce a detectable stack inconsistency.

(assert_invalid
  (module
    (func $push-and-conditional-pop
      (call $push-values)
      (i32.const 1)
      (br_if 0 (i32.const 0))
      (drop)
      (drop)
    )
    (func $push-values
      (i32.const 42)
      (i32.const 24)
    )
  )
  "type mismatch"
)