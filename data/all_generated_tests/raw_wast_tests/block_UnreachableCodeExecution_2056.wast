;; 7. **Test 7: Nested Block ending with Unreachable**    - **Description**: Create nested blocks where the innermost block ends with an `unreachable` instruction, ensuring termination and error at the right point.    - **Constraint**: Ensures that block termination occurs correctly upon reaching an `unreachable` at the end.

(assert_invalid
  (module
    (func $nested-block-with-unreachable (result i32)
      (block (result i32)
        (block (result i32)
          (unreachable)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)