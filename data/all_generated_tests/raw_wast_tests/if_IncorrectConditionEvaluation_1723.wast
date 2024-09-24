;; - Use an `if` condition with a nested `br` instruction within the `else` block to see if it correctly unconditionally branches out, ensuring the context extension for else is handled properly.

(assert_invalid
  (module (func $nested-else-br (result i32)
    (if (result i32) (i32.const 0)
      (then (i32.const 1))
      (else (br 0) (i32.const 1))
    )
  ))
  "type mismatch"
)