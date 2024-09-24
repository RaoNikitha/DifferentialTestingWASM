;; 4. **Unreachable Label Misinterpretation**:    - Design an `if` block with a nested `unreachable` instruction followed by a `br` instruction. Ensure the `br` correctly resolves the label upon reaching it, even after an unreachable instruction, without causing a trap or mis-jump.    - **Constraint**: Proper label resolution details should be maintained even if preceded by `unreachable`.

(assert_invalid
  (module
    (func $unreachable_br (if (result i32)
      (i32.const 1)
      (then
        (unreachable)
        (br 0)
      )
      (else
        (i32.const 0)
      )
    ))
  )
  "unreachable reached br label misinterpretation"
)