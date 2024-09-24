;; 8. **Test 8**:     - Description: Set up `try-catch` blocks with `nop` instructions inside, followed by an `unreachable` to see if `nop` affects exception handling reaching the `unreachable`.    - Constraint: Validating `nop`'s effectlessness within error handling constructs.

(assert_invalid
  (module
    (func $test-try-catch-nop
      (try
        (do (nop))
        (catch (unreachable))
      )
    )
  )
  "type mismatch"
)