;; 2. **Test with Insufficient Values Before Return**:    - Implement a function where less than the required number of values are pushed onto the operand stack before a `return` instruction. Validate that both implementations raise an appropriate error rather than causing underflows and subsequent stack corruption.

(assert_invalid
  (module
    (func $insufficient-values-before-return (result f32)
      (f32.const 1.0)
      (return)
    )
  )
  "type mismatch"
)