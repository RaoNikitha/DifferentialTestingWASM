;; 5. **Test Blocktype Mismatch Leading to Unreachable**:    - Employ an `if` instruction with a blocktype mismatch between `then` and `else` instructions and add `unreachable` in `then`. Validate if this can bypass proper type checking and hit `unreachable`.

(assert_invalid
  (module (func $blocktype-mismatch-unreachable (result i32)
    (if (result i32)
      (i32.const 1)
      (then (unreachable))
      (else (f64.const 1))
    )
  ))
  "type mismatch"
)