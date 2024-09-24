;; ```plaintext 1. Test a branching scenario where the `br` instruction targets a deeply nested label to verify that the stack is unwound correctly. Ensure that the operand stack is at its maximum depth to test for potential stack overflow scenarios.

(assert_invalid
  (module
    (func (block (block (block (block (block (block (block (block (block (block (br 10))))))))))))
  )
  "unknown label"
)