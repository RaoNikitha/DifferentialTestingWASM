;; 6. Design a test where an `if` instruction, after evaluating an `i32` condition, includes an `else` branch with code that requires an `i64` value, despite the outer block declaring only `i32` types. This ensures type mismatches in alternative branches are detected.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32) (i32.const 1)
        (then (i32.const 42))
        (else (i64.const 42)) ;; type mismatch here as per instruction
      )
    )
  )
  "type mismatch"
)