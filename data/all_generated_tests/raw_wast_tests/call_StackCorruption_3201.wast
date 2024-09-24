;; Test Description 10: Design a function with variadic returns (returns an i32 only if some condition is met). The caller should handle both cases (with and without return). Verify that stack states are appropriately managed regardless of whether the value is returned, detecting issues with conditional return handling.

(assert_invalid
  (module
    (func $test (call 1 (i32.const 0)))
    (func (result i32)
      (if (i32.eq (i32.const 1) (i32.const 1))
        (then (i32.const 42))
      )
    )
  )
  "type mismatch"
)