;; 8. **Test 8: Try-Catch with Unreachable and Conflicting Types**    - A `try-catch` block where the `unreachable` instruction within the `try` leads to type mismatches between the `try` and `catch` branches.    - **Constraint Checked:** Ensures consistent type handling and propagation in exception handling contexts involving `unreachable`.

(assert_invalid
  (module
    (type $none-to-void (func (result)))
    (func $try-catch-unreachable (result i32)
      (try (result i32)
        (do
          (unreachable)
          (i32.const 1)
        )
        (catch
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)