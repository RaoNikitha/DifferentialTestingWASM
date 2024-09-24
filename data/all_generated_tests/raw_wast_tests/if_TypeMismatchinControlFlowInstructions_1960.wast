;; 1. Create a test with an `if` instruction where the `blocktype` specifies two `i32` values as input, but the `then` branch uses an `f64` value. This will check if type enforcement correctly handles mismatches between declared block types and actual usage.

(assert_invalid
  (module (func $diff_test (result i32 i32)
    (if (result i32) (i32.const 1) (then (f64.const 0.0)) (else (i32.const 0)))
  ))
  "type mismatch"
)