;; 4. **Test 4**:     - Description: A function consisting solely of `nop` instructions ending with a return that should never reach `unreachable` when the function's result is incorrect. Check if any `nop` misbehaves.    - Constraint: Testing consistency of `nop` during function execution flow.

(assert_invalid
  (module (func $test-nop
    (nop)
    (nop)
    (nop)
    (return)
    (unreachable)))
  "unexpected unreachable"
)