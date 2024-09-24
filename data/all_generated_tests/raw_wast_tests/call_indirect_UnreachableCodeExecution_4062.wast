;; 1. **Test Unreachable Code Execution on Invalid Table Index**:    - **Description**: Create a test that attempts to use a call_indirect instruction with a table index that is out of bounds.    - **Constraint Checked**: Verify proper boundary checking for table indexing. The test should result in a trap if the index is invalid or out of bounds.    - **Relation to Unreachable**: Ensure that an out-of-bounds index does not inadvertently reach an 'unreachable' instruction due to a mishandled index.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem 0))
    (func (result i32)
      (call_indirect (type $sig) (i32.const 1))
    )
  )
  "out of bounds table index"
)