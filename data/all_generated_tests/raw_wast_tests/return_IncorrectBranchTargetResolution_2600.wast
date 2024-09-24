;; 9. **Test Description**:    Design a function with labels that use multiple `loop` constructs with nested branches and a `return` instruction just before the end of an inner loop. Verify the `return` function ignores the loop context and returns correctly.    - **Specific Constraint**: Confirms correct label resolution ignoring loop structures.    - **Incorrect Branch Target Resolution**: Ensures correct `return` handling in the presence of loops.

(assert_invalid
  (module
    (func $nested-loops-with-return (result i32)
      (loop
        (loop
          (i32.const 0)
          (return)
        )
      )
    )
  )
  "type mismatch"
)