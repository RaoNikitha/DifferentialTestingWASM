;; 10. **Test with Conditional Function Call Outcome**:     - **Description**: Execute a function call conditionally based on a prior execution result and validate correct branching.     - **Constraint Checked**: Ensures conditional results are correctly used for subsequent function calls.     - **CFG Relation**: Validates correct path dependencies in the CFG, ensuring conditional branches correctly lead to accurate function calls.

(assert_invalid
  (module
    (func $conditional-call (param i32) (result i32)
      (local.get 0)
      (if (i32.eqz)
        (then (call 1) (drop))
        (else (call 2) (drop))
      )
    )
    (func (result i32) (i32.const 0))
    (func (param i32) (result i32) (local.get 0))
  )
  "type mismatch"
)