;; 2. **Mismatched Operand Type for `br` Instruction**: Construct a loop with an operand stack of integers, but use a `br` instruction that attempts to branch with a float operand. This will check if the type constraints for branch instructions in control flow are correctly applied.

(assert_invalid
  (module
    (func $mismatched-operand-type
      (loop (result i32)
        (f32.const 0.0)
        (br 0)
      )
    )
  )
  "type mismatch"
)