;; 2. Construct an `if` instruction with a `blocktype` that outputs an `i32`, but both the `then` and `else` branches attempt to return `f64` values. This ensures the output type enforcement works correctly.

(assert_invalid
  (module (func $type-i32-vs-f64 (result i32)
    (if (result i32)
      (i32.const 1)
      (then (f64.const 1.0))
      (else (f64.const 2.0))
    )
  ))
  "type mismatch"
)