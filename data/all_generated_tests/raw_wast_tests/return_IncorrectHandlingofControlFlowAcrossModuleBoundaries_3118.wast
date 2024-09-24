;; 7. **Type Mismatch Handling in Returns**:    - Deliberately invoke an imported function that returns a type different from what the calling function expects. Validate that the type mismatch is caught and handled per the specification in both implementations.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $type-value-mismatch-in-return (result f64)
      (call $external_func)
      (return)
    )
  )
  "type mismatch"
)