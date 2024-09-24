;; 3. **Test Description**: Use an out-of-bounds index for the table in a `call_indirect` call and verify if it results in a trap. Ensure the index is just beyond the table size.    - **Constraint Checked**: Table structure and indexing.    - **Relation to Improper Handling**: Ensures proper boundary checks for table indexing to prevent improper jumps.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem null func))
    (func (call_indirect (type 0) (i32.const 1)))
  )
  "out of bounds table index"
)