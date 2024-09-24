;; 10. **Unreachable Code with Branching**    - Construct a test where a loop contains unreachable code followed by a `br` instruction, checking if the unreachable code is skipped and the branch correctly resolves to the intended loop label.

(assert_invalid
  (module
    (func (loop 
      (unreachable)
      (br 0)
    ))
  )
  "unreachable code handling"
)