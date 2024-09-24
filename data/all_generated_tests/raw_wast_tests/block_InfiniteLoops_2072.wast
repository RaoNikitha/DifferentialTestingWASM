;; 3. **Test Description:**    A block with a loop that contains a `br_table` instruction always branching back to the start of the loop.      **Constraint Checked:** Label management and proper stack effects of `br_table`.      **Relation to Infinite Loops:** Verifies if the branch table correctly interprets labels, preventing infinite looping.

(assert_invalid
  (module (func $loop-with-br-table (result i32)
    (block (result i32)
      (loop $label
        (br_table $label $label (i32.const 0))
        (i32.const 1)  ;; Unreachable code due to above branch
      )
    )
  ))
  "type mismatch"
)