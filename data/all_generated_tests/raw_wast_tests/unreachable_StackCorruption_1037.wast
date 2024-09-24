;; 8. Test Description: Test using `unreachable` inside a `try-catch` sequence to confirm that the stack state maintains integrity when control flow is abruptly changed by a trap, simulating exception handling scenarios.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (try (result i32)
        (i32.const 1)
        (unreachable)
      ) (catch)
    )
  ))
  "type mismatch"
)