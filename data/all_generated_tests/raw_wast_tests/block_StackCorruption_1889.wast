;; 10. **Blocks with Redundant End Tokens**:    - Description: Create blocks that mistakenly include redundant `end` tokens within them, causing incorrect block termination.    - Constraint: Proper block termination and end token handling.    - Reasoning: Testing for over-termination of blocks might reveal improper context restoration and stack balance checks on block closure.

(assert_invalid
  (module (func $redundant-end
    (block
      (i32.const 1)
      (end)
      (block (end))
    )
  ))
  "unexpected end of section or function"
)