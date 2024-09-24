;; 6. **Invalid Branching in Chained Loops**:    - **Description**: Test chained loops where a `br` instruction is supposed to restart an inner loop but incorrectly branches to an unrelated block or loop due to invalid label indexing.    - **Constraint**: Ensuring labels introduced by `loop` are correctly indexed and branches refer to the correct loop level.

(assert_invalid
  (module
    (func $invalid-branching-in-chained-loops
      (block
        (loop (result i32)
          (i32.const 1)
          (loop (result i32)
            (i32.const 2)
            (br 2) ; Incorrectly branches to the outer block instead of restarting the inner loop
          )
        )
      )
    )
  )
  "unknown label"
)