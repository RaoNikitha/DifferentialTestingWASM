;; 6. **Stack Unwind with Unreachable**:    Verify stack behavior by creating a loop that prematurely drops stack values needed for later execution, leading directly to an `unreachable` instruction. Test if operand stack integrity is maintained as expected before reaching the trap.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (i32.const 1)
        (drop)
        (unreachable)
        (i32.const 0)
      )
    )
  )
  "unreachable instruction"
)