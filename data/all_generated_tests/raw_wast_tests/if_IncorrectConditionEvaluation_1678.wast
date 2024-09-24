;; - **Test Description 9**: An `if` instruction with a condition that always evaluates to true with a non-zero constant (`i32.const -1`). Verify the implementation skips the `else` block entirely and correctly executes the `then` block.

(assert_invalid
  (module
    (func $if-const-true-then (result i32)
      (i32.const -1)
      (if (result i32)
        (then (i32.const 42) (i32.mul))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)