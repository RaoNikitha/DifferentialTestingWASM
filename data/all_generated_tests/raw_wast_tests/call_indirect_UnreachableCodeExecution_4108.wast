;; 7. **Test Description**:    Populate a table with correct entries, but initialize a `call_indirect` with a negative index where the function ends with an `unreachable`. Verify if the implementation correctly catches the index error.    - **Constraint Checked**: Table index validation.    - **Relation to Unreachable Code Execution**: The index check fails and traps, so the `unreachable` instruction should not be executed.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (func $f (param i32) unreachable)
    (table $table 1 funcref (elem $f))
    (func $test
      (i32.const -1)
      (call_indirect (type $sig) (i32.const -1))
    )
  )
  "index out of bounds"
)