;; 6. Define an `if` instruction with mismatched blocktype input and output types in the `then` and `else` branches, examining how the CFG validates stack types.

(assert_invalid
  (module (func $mismatched-blocktype
    (if (result i32)
      (i32.const 1)
      (then (f64.const 0.0))
      (else (i32.const 2))
    )
  ))
  "type mismatch"
)