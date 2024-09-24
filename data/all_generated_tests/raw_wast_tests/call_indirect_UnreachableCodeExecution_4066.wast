;; 5. **Test Unreachable Due to Invalid Type Index Reference**:    - **Description**: Use a type index for call_indirect that references an invalid or non-existent function type.    - **Constraint Checked**: Ensure valid type indexing and proper error handling for invalid indices.    - **Relation to Unreachable**: Verify that invalid type indices do not result in the control reaching an 'unreachable' instruction.

(assert_invalid
  (module
    (table funcref (elem 0))
    (type $invalid (func (param i32) (result i32)))
    (func (param i32 i32)
      (call_indirect (type 999) (i32.const 0) (i32.const 0))
    )
  )
  "unknown type"
)