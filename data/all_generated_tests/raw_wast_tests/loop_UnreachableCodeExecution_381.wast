;; 2. **Conditional Branch Leading to Unreachable Instruction**:    Inside a loop, use a conditional branch (`br_if 0`). Place an `unreachable` instruction both inside and after the loop block to test if the `br_if` miss-handles context extension, causing execution to reach the `unreachable` instruction.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (i32.const 1)
        (br_if 0)
        (unreachable)
      )
      (unreachable)
    )
  )
  "type mismatch"
)