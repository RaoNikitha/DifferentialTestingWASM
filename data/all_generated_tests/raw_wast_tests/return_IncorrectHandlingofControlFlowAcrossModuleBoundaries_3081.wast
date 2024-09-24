;; 10. **Test 10: Erroneous Return from Imported Function**    - Description: Import a function designed to return erroneous or unexpected results and verify how the calling module handles the inconsistency.    - Relation: This test aims to expose incorrect handling or passing of control flow when unexpected return values propagate across boundaries.  These differential tests are designed to probe the handling of return instructions specifically across the boundaries between WASM modules, checking for consistency and correctness in control flow and stack management.

(assert_invalid
  (module
    (import "env" "erroneous_func" (func $erroneous_func (result i32)))
    (func $test_func
      (return (call $erroneous_func))
    )
  )
  "type mismatch"
)