;; 5. **Test Description:** Use a `br_table` instruction to drive the control flow into various nested blocks containing `unreachable`. It ensures that the correct block depth is interpreted and trapping occurs precisely at the intended block.        **Constraint Checked:** Accurate depth interpretation and trapping within dynamically branched nested blocks.

(assert_invalid
  (module
    (func $testBrTableWithUnreachable
      (block (block (block 
        (br_table 0 1 2 (i32.const 2))
        (unreachable)
      )))
    )
  )
  "unreachable executed"
)