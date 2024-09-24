;; 9. **Test Description:**    - Write a test where `unreachable` is used inside a loop body containing a branch table, with the table targeting a `br_if` outside the loop. Trap should stop loop despite complex control flow.    - Constraint: Tests `unreachable` interaction with branch tables and loops.    - Infinite Loop Relation: Ensures that even complex branching scenarios do not lead to infinite loops due to proper trapping.

(assert_invalid
  (module
    (func $complex_loop (loop (br_table 0 0 (br_if 0 (i32.const 1))) (unreachable)))
  )
  "unreachable executed"
)