;; 1. **Test Description:**    Create a nested loop with three levels, where an inner loop contains a `br` instruction that targets the outermost loop. This test should verify if the `br` correctly resolves the outermost loop label and jumps accordingly without mistakenly targeting an intermediate loop.

(assert_invalid
  (module
    (func
      (block (loop (block (loop (br 3))))
    )
  ))
  "unknown label"
)