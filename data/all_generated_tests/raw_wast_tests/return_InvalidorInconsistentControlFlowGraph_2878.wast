;; 7. **Unwinding Stacks with Intermediate Values**:    - Implement a function where intermediate values are pushed onto the stack but never utilized due to an immediate `return`. This will test if the CFG can accurately identify and discard these intermediate stack values.

(assert_invalid
  (module
    (func $unwind-stack-intermediate (result i32)
      (i32.const 0)
      (i32.const 1)
      (return)
      (i32.const 2)
    )
  )
  "type mismatch"
)