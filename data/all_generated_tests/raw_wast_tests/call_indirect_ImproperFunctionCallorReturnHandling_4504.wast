;; 3. **Test Description**: Use `call_indirect` to index into a table with an out-of-bounds index.    **Constraint Checked**: Validates that proper boundary checks are in place.    **Relation to Improper Handling**: Proper handling traps prevent invalid function calls and potential jumps to unintended code.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (result i32) (i32.const 42))
    (func (call_indirect (type 0) (i32.const 2)))
  )
  "out of bounds table access"
)