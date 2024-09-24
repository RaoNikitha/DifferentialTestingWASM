;; 9. **Test 9: Loop with Dynamic Index `br_table` Leading to Unreachable**    - Dynamic index calculation in a loop for `br_table`, leading to an `unreachable` target.    - **Reasoning:** Examines dynamic index scenarios and consistent trapping behavior.    - **Constraint:** Ensures correct and consistent trapping in dynamic index-dependent `br_table`.

(assert_invalid
  (module (func $loop-with-br_table-unreachable
    (block (loop (br_table 0 0 (unreachable))))
  ))
  "unreachable trap"
)