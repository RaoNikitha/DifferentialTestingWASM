;; Incorporate a `nop` instruction right after a `call` instruction within an `if` statement to ensure the conditional execution flow and function calls are correctly followed, validating that `nop` does not alter the branching behavior or return values.

(assert_invalid
  (module
    (func $test (param i32) (result i32)
      (if (result i32)
        (local.get 0)
        (then (call $some_func) (nop))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)