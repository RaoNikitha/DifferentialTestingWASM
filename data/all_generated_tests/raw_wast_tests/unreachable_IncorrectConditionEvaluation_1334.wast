;; Design a function that calls another function containing an `unreachable` within a conditionally evaluated `br_if`. Ensure that the call causes an immediate trap upon the inner function’s `unreachable` instruction execution.

(assert_invalid
  (module (func $inner (param i32)
    (i32.const 1)
    (br_if 0 (i32.const 1))
    (unreachable)
  )
  (func $outer
    (call $inner (i32.const 42))
  ))
  "type mismatch"
)