;; 10. **Loop with Invalid Signature Return Type**:    - **Description**: Test a loop with a blocktype whose return type does not match the type expected by the surrounding context.    - **Constraint Checked**: Ensures return types are consistent with the context.    - **Relation to CFG**: Mismatched return types lead to inconsistent block exits and invalid CFG transitions.

(assert_invalid
  (module (func $invalid-signature-return (result i32)
    (loop (result i32) (i32.const 1) (br 0))
  ))
  "type mismatch"
)