;; 1. **Deeply Nested Loop Branch:**    Test a deeply nested loop structure with multiple labels, where the `br` instruction is used to jump to an outer loop. Verify if the branch correctly lands in the outer loop instead of reaching an `unreachable` instruction within an inner loop, making sure the label indices are handled properly. This checks for proper label indexing and control entry handling.

(assert_invalid
  (module
    (func $deep-nested-loop
      (block
        (loop $outer
          (block
            (loop $inner
              (br 1)
              unreachable
            )
          )
        )
      )
    )
  )
  "type mismatch"
)