;; Test 4: Implement an `if` instruction with a `then` block having instructions that produce a `f64` output and an `else` block producing an `i64` output. Verify mismatches in the block’s output type consistency.

(assert_invalid
  (module (func $block-output-mismatch (result f64)
    (if (result f64) (i32.const 1)
      (then (f64.const 3.14))
      (else (i64.const 42))
    )
  ))
  "type mismatch"
)