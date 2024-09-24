;; 5. **Unexpected Default Label with Inconsistent Operand Types:**    Create a `br_table` to branch to a default label that changes the expected operand types inconsistency within the CFG. This will validate if the control flow grapples with such inconsistency properly.

(assert_invalid
  (module (func $unexpected-default
    (block (param i32 i32)
      (block
        (br_table 0 0 1 (i32.const 0))
      )
    )
  ))
  "type mismatch"
)