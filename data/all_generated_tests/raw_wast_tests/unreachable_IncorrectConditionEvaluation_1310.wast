;; 1. Create a function containing an `if` conditional with a comparison of two `i32` values followed by the `unreachable` instruction inside the `then` branch. The test checks if an incorrect evaluation always results in trapping regardless of the condition's truth value.

(assert_invalid
  (module (func $unreachable_in_if (result i32)
    (i32.const 1) (i32.const 2)
    (if (then
      (unreachable)
    ))
  ))
  "type mismatch"
)