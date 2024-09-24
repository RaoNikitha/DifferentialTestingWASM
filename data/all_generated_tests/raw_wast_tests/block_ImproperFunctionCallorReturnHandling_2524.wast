;; 5. **Correct Type Handling on `call_indirect` Return**:    - **Description**: Utilize `call_indirect` inside a block to call a function that returns a different type than expected. Check if the block handles the type mismatch or produces an error.    - **Constraint**: Check returning value types and type matching for indirect calls.    - **Improper Handling**: Incorrect type return handling could lead to stack corruption or misalignment.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $type-call-indirect (result f64)
      (block (result f64)
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "type mismatch"
)