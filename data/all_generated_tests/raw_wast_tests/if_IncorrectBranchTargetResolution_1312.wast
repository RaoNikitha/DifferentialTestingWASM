;; 3. **Test: Improper Label in Non-Nested Block**:    - **Description**: Create an `if` statement followed by a `br` instruction in the `then` part that targets a label as if it were nested within another block.    - **Constraint**: Ensures validations are correctly scoped to avoid improper jumps.    - **Relation to Branch Target Resolution**: Tests the handling of labels intended for nested blocks within an outer single block context.

(assert_invalid
  (module
    (func
      (i32.const 1)
      (if
        (block
          (br 1)
        )
      )
    )
  )
  "unknown label"
)