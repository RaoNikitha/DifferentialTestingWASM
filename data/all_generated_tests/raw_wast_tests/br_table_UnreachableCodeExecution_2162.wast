;; 2. Implement a `br_table` instruction with nested blocks and an out-of-bounds operand. Ensure that the default target label points to an inner block with the `unreachable` instruction. Validate if both implementations successfully unwind the stack correctly and handle nested scope branching without executing the `unreachable` instruction.

(assert_invalid
  (module
    (func (block 
      (loop 
        (block
          (br_table 0 0 (i32.const 2))
          (unreachable)
        )
      )
    ))
  )
  "invalid default label"
)