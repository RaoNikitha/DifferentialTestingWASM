;; 3. Implement a test where an `if` instruction is immediately followed by an `unreachable` instruction before an `else` branch. Ensure that the `unreachable` instruction prevents the flow from reaching the `else` branch, triggering a trap instead.

(assert_invalid
  (module (func $if-unreachable-before-else (result i32)
    (if (result i32) (i32.const 1)
      (then (unreachable))
      (else (i32.const 0))
    )
  ))
  "unreachable instruction prevents flow to else branch"
)