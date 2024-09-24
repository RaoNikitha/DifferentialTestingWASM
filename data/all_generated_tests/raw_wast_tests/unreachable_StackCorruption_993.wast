;; 4. Design a test with a `call` instruction right before an `unreachable` instruction. Verify that function return values do not affect the stack state post-trap and subsequent instructions produce the same stack output.

(assert_invalid
  (module (func $test-unreachable-with-call
    (call $func) (unreachable) (i32.const 0)
  ))
  "type mismatch"
)