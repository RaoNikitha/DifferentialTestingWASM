;; 2. **Test Description**:    Create a table indexing with a correct function type but pass an out-of-bounds index to `call_indirect` in a function that ends with an `unreachable` instruction.    - **Constraint Checked**: Table index out-of-bounds handling.    - **Relation to Unreachable Code Execution**: If the table index check fails, it should trap, avoiding the `unreachable` instruction.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $unreachable-test (param i32) (result i32)
      (call_indirect (type 0) (i32.const 2))
      unreachable
    )
  )
  "out of bounds table index"
)