;; 7. Set up an `if` instruction with the `then` branch ending in an `unreachable` instruction, but attempts to output a `f64` value before `unreachable`, whereas the `blocktype` expects an `i32` result. This checks type checks before `unreachable` instructions.

(assert_invalid
  (module (func $type-then-unreachable (result i32)
    (if (result i32)
      (i32.const 1)
      (then (f64.const 0.0) (unreachable))
      (else (i32.const 2))
    )
  ))
  "type mismatch"
)