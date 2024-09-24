;; 6. **Test Unreachable Following Valid `then` Block**:    - An `if` instruction where `then` performs valid operations followed by an `unreachable` instruction. Examine the effect of no reset, causing erroneous execution.

(assert_invalid
  (module (func $test-unreachable-after-valid-then (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 1))
      (else (unreachable))
    )
  ))
  "type mismatch"
)