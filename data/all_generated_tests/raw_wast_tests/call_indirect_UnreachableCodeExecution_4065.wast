;; 4. **Test Handling of Unreachable Code Within Called Function**:    - **Description**: Construct a function that contains an 'unreachable' instruction and ensure call_indirect points to this function.    - **Constraint Checked**: Proper resolution and execution of functions containing 'unreachable'.    - **Relation to Unreachable**: Ensure call_indirect appropriately triggers the 'unreachable' instruction within the called function, leading to a trap.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem $f))
    (func $f (unreachable))
    (func (call_indirect (type 0) (i32.const 0) (i32.const 0)))
  )
  "unreachable code"
)