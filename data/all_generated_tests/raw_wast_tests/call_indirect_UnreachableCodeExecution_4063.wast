;; 2. **Test Unreachable Code Execution with Mismatched Function Type**:    - **Description**: Design a test where the call_indirect instruction is given a type index that does not match the function type in the table.    - **Constraint Checked**: Check for dynamic type conformity and proper trapping on type mismatch.    - **Relation to Unreachable**: Ensures that a type mismatch does not lead the program flow to an 'unreachable' instruction inadvertently.

(assert_invalid
  (module
    (func $f (param i32) (result i32) (unreachable))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $test
      (i32.const 0)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)