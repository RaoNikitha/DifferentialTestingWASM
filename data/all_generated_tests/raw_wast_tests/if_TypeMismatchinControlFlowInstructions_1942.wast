;; 3. An `if` instruction that, inside its `then` block, attempts to return a `[]` but is instead expected to return a value of type `i32`, mismatched result types leading to validation failure.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32) (i32.const 1) (then (else)))
    )
  )
  "type mismatch"
)