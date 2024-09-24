;; 3. **Test 3: `nop` Inside Conditional in Imported Function**    - Insert a `nop` within an `if-else` block in an imported function to test its impact on conditional control flow.    - Test that `nop` does not alter the execution path as control transitions back to the caller.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func $test
      (if
        (i32.const 1)
        (then (nop))
        (else)
      )
    )
    (func (call $external_func))
  )
  "type mismatch"
)