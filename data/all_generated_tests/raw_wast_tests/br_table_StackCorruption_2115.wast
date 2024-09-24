;; Test 5: Test the misalignment in operand types by crafting `br_table` instructions that try to branch to target labels with expected operand configurations differing by sequence and types. Check for stack overflow or underflow due to improper operand management during such transitions.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result i64)
        (br_table 0 1 (i32.const 0) (i64.const 1))
      )
    )
  ))
  "type mismatch"
)