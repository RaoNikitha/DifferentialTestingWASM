;; 9. **Test Description**: Validate the behavior when importing a function with incorrect types from an external module. This should disrupt the call stack sufficiently to test if the unreachable instruction is erroneously executed.

(assert_invalid
  (module
    (import "env" "external_func" (func $imported_func (param i32) (result i32 f64)))
    (func $test_func
      (call $imported_func (i32.const 42))
    )
  )
  "type mismatch"
)