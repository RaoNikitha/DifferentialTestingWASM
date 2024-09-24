;; 2. Test Description 2: Generate a `br_table` instruction within a loop that attempts to branch to a label with mismatched operand types compared to the stack elements just before the instruction.

(assert_invalid
  (module (func $mismatched-operand-types-in-loop
    (loop (result i32)
      (block
        (drop (br_table 0 1 (i32.const 0) (f32.const 1.0)))
      )
    )
  ))
  "type mismatch"
)