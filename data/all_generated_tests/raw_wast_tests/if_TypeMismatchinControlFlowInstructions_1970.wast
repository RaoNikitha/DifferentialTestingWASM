;; Test 1: Provide an `if` instruction with a block type `i32` but give an `i64` as the input condition on the stack. Check for type mismatch errors.

(assert_invalid
  (module (func $type-i32-block-i64 (result i32)
    (i64.const 0) ;; pushing i64 instead of i32
    (if (result i32) (then (i32.const 1)) (else (i32.const 0)))
  ))
  "type mismatch"
)