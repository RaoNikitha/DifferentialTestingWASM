;; 10. **Test Description**: Function called with indirect table that includes type checks and conditional calls.    - **Constraint Checked**: Ensures type checks and conditional logic within indirect table entries correctly resolve function calls.    - **Improper Handling**: Detects if improper type checks or incorrect conditional jumps corrupt function execution paths or stack states.

(assert_invalid
  (module
    (type (func))
    (table 1 funcref)
    (func $type-invalid-indirect
      (call_indirect (type 0) (i32.const 0))
    )
    (elem (i32.const 0) $dummy)
    (func $dummy)
  )
  "type mismatch"
)