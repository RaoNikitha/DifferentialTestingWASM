;; 6. Place an `unreachable` instruction in a `loop` that should produce `i32` values, but follow it with instructions that produce `i64` values. Confirm proper type-checking and trapping behavior.

(assert_invalid
  (module (func $unreachable_test_in_loop
    (result i32)
    (loop (result i32)
      (unreachable)
      (i64.const 0)
    )
  ))
  "type mismatch"
)