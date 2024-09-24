;; 1. **Test Description**: Create a block with an immediate `br_if` instruction that conditionally branches to a label outside the block, followed by an `unreachable` instruction. The goal is to test if the `br_if` can prevent the unreachable instruction from being executed by properly managing the operand stack.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 1)
        (i32.const 0)
        (br_if 0)
        unreachable
      )
    )
  )
  "type mismatch"
)