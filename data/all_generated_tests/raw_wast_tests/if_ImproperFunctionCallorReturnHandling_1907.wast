;; 8. **Invalid Module Instance for Function Call**:    - Call a function from an un-initialized or invalid module within an `if` block.    - Test consistency in module validation and function instance correctness.

(assert_invalid
  (module
    (func $invalid-module-instance-call
      (if (result i32)
          (i32.const 1)
          (then (call 999))
          (else (i32.const 0))
      )
    )
  )
  "invalid function index"
)