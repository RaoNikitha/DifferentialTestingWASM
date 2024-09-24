;; 6. **Test Description**: Create a sequence with `nop` followed by variable push and pop operations. Evaluate whether the stack correctly reflects only the variables pushed and popped, ignoring the presence of the `nop` instruction entirely.

(assert_invalid
  (module
    (func $nop-sequence
      i32.const 1
      nop
      i32.const 2
      drop
      drop
    )
  )
  "type mismatch"
)