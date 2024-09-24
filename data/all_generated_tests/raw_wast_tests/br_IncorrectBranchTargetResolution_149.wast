;; Test correct and incorrect operand handling by creating nested control flow structures where the `br` instruction incorrectly branches and consumes mismatched stack operands, checking if the branch logic recognizes and handles operand mismatches.

(assert_invalid
  (module
    (func $incorrect-operand-handling
      (block (result i32)
        (i32.const 42)
        (block (br 1))
      )
    )
  )
  "type mismatch"
)