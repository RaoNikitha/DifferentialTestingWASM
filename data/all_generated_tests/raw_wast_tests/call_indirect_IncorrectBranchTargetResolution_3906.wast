;; 5. **Test Case 5**:    - **Description**: Create a complex control flow including nested blocks with `call_indirect`. Use `br_table` with multiple indices to verify if each branch target in the jump table properly resolves to the respective blocks without misalignment.    - **Constraint Checked**: Ensures handling of indirect branching through `br_table`.    - **Incorrect Branch Target Resolution**: Validates that each branch target within the jump table is correctly resolved with respect to call scope.

(assert_invalid
  (module
    (type (func))
    (type (func (param i32)))
    (type (func (param i32 i32 i32) (result i32)))
    (func (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 0 1 (i32.const 0))
          (call_indirect (type 1) (i32.const 1))
        )
        (call_indirect (type 0) (i32.const 0))
      )
    )
    (table funcref (elem $f $f))
  )
  "type mismatch"
)