;; 5. **Test Description:**    Implement a nested loop and block structure where the `br` instruction within an `if` statement targets the top-level block. The test ensures that the `br` instruction correctly resolves the top-level block label, not making an incorrect branch to any inside loop or block.

(assert_invalid
  (module
    (func $nested-loop-block
      (block $top
        (loop $outer
          (block $inner
            (if (i32.const 1)
              (then
                (br $top)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)