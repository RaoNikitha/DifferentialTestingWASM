;; 8. **Test Description:** Create a nested `if-else` structure where `unreachable` is in the `then` clause and the `else` clause depends on multiple `i32` operations.    **Constraint:** The `else` clause should expect integers, tracing checks if `unreachable` impacts type expectations.    **Reasoning:** Confirms type assumptions within conditional constructs reflect accurate processing of `unreachable` traps.

(assert_invalid
  (module (func $test-unreachable-if-else
    (if (i32.const 1)
      (then (unreachable))
      (else (drop (i32.add (i32.const 1) (i32.const 2))))
    )
  ))
  "type mismatch"
)