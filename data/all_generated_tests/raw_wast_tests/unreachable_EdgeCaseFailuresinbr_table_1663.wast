;; 4. **Test Case 4:** Define a loop that has a `br_table` inside it, with `unreachable` as an entry point into the loop before the `br_table`. Ensure that entering the loop causes an immediate trap, not allowing branch evaluation. \    _Constraint Checked: Immediate trapping at entry points causing loop preemption._

(assert_invalid
  (module (func $loop-br_table-unreachable-entry
    (block 
      (loop 
        (unreachable) 
        (br_table 0 (i32.const 0))
      )
    )
  ))
  "unreachable entry traps immediately"
)