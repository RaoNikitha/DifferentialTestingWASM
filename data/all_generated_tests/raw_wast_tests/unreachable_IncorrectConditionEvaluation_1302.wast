;; 3. Embed an `unreachable` instruction within an `else` clause of an `if-else` structure which has a `br_if` that should skip over the `else` part based on the condition. Confirm that reaching `unreachable` within the `else` part traps immediately and `br_if` evaluates the condition correctly.

(assert_invalid
  (module
    (func $test (i32.const 1) (br_if 0) (if (then (unreachable)) (else (unreachable) (i32.const 0)))
  ))
  "type mismatch"
)