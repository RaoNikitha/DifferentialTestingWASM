;; 7. Insert a `nop` in an `else` branch that contains an `unreachable` instruction, validating that only the `if` branch gets executed correctly without the erroneous entry to `unreachable`.

(assert_invalid
  (module (func (param i32) (result i32)
    (if (result i32) (nop)
      (then (i32.const 42))
      (else (nop) (unreachable))
    )
  ))
  "type mismatch"
)