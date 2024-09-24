;; 5. **Test 5: Unreachable in Invalid Structured Jump**    - Implement an incorrectly nested block structure where a `br` instruction attempts to exit a block not conforming to strict hierarchy and place an `unreachable` right after it.    - Checks if the engine recognizes the invalid branch and whether it encounters the unreachable instruction.

(assert_invalid
  (module
    (func
      (block
        (block (br 1))
        (unreachable)
      )
    )
  )
  "invalid branch"
)