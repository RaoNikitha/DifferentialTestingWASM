;; 2. **Nested Loop with Unreachable Instruction**:    - Design nested loops where the inner loop contains an `unreachable` instruction that should never be executed.    - **Constraint**: Validates the correct nesting and label indexing.    - **Relation to Unreachable Code Execution**: Ensures that control flow within nested loops correctly skips `unreachable` code.

(assert_invalid
  (module 
    (func $nested-loop-with-unreachable
      (block 
        (loop $outer (result i32) 
          (loop $inner (result i32)
            (unreachable)
          )
          (br 1)
        )
      )
    )
  )
  "unreachable code should not be executed"
)