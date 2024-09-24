;; 6. **Test Description**: Create an `if` instruction that conditionally executes an `unreachable` instruction within its `then` part. The test should verify that the correct trap occurs only if the condition is true, ensuring accurate condition handling.

(assert_invalid
  (module
    (func $conditional-trap (param i32)
      (if (local.get 0)
        (then unreachable)
        (else (i32.const 42))
      )
    )
  )
  "unreachable executed"
)