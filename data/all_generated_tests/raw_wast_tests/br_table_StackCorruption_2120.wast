;; Test 10: Embed a `br_table` instruction in a nested loop where the loop condition and iterations depend on real-time operand stack changes. Analyze stack state at every iteration boundary and loop exit points to detect any erroneous stack configurations or mismatches due to branching operations.

(assert_invalid
  (module (func
    (block (result i32)
      (loop (result i32)
        (block (br_table 0 1 2 (i32.const 1)) (br_table 0 1 2 (i32.const 0)))
        (i32.const 42) (br 1)
      )
    )
  ))
  "type mismatch"
)