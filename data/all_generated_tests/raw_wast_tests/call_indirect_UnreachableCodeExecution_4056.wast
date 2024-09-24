;; 5. **Test Description**: Attempt to call a function with `call_indirect` that has been removed or modified to include an `unreachable` instruction. Ensure the table entry has not been properly updated.    - **Constraint Checked**: Validity and updates of table references.    - **Unreachable Code Execution**: Ensures proper trapping for stale or corrupt table entries, preventing erroneous `unreachable` execution.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 1 funcref)
    (func $to_be_removed (param i32) (unreachable))
    (elem (i32.const 0) $to_be_removed)
    (func $test_call
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)