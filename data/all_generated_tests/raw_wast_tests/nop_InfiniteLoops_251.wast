;; 2. **Test Description**: Create a nested loop with an outer loop containing `nop` and an inner loop, where a `br` instruction should escape the inner loop.    - **Constraint**: Verifies that `nop` does not affect the nested control flow.    - **Relation to Infinite Loops**: Checks if the inner loop correctly exits without getting stuck due to any influence of the `nop` instruction.

(assert_invalid
  (module
    (func $nested-loops
      (loop $outer
        (nop)
        (loop $inner
          (br $inner)
        )
        (br $outer)
      )
    )
  )
  "loop with unreachable end"
)