;; 8. **Test 8:** Position `unreachable` in a loop controlled by a `br_table` instruction making sure differing paths can still access `unreachable`.    - **Constraint:** Verify that `br_table` options correctly resolve to `unreachable`.    - **Relation to Infinite Loops:** Confirms non-infinite behavior by ensuring all table paths can validly reach and trigger `unreachable`.

(assert_invalid
  (module (func $loop-br_table-unreachable
    (block
      (loop
        (br_table 0 0 (i32.const 1))  ; Decision point in `br_table` leading to `unreachable`
      )
    )
    (unreachable) ; Trigger the trap via any path reaching here
  ))
  "type mismatch"
)