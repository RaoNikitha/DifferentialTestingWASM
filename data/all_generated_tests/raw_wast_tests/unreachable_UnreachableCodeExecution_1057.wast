;; 8. Place an `unreachable` instruction directly before the end of a function and confirm the function traps immediately when the `unreachable` is executed.

(assert_invalid
  (module (func $test-unreachable-before-end
    (unreachable)
  ))
  "unexpected end of section or function"
)