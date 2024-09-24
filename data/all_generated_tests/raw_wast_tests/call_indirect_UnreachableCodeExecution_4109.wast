;; 8. **Test Description**:    Use `call_indirect` in a function and simulate it to choose the entry with an invalid table with non-`funcref` entries, ending naturally with an `unreachable`.    - **Constraint Checked**: Valid table element type.    - **Relation to Unreachable Code Execution**: Invalid entry type should yield a trap, preventing the `unreachable` from being hit.

(assert_invalid
  (module
    (type (func))
    (table $t1 1 externref) 
    (func $test
      (i32.const 0)
      (call_indirect (type 0) (table $t1))
      unreachable
    )
  )
  "invalid table type"
)