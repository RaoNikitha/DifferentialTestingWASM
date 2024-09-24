;; 10. **Test Description**: Model a `block` where a `br_if` conditionally branches to a label within an imported function ending with an excess stack value.     **Constraint**: Evaluate if stack entropy caused by incorrect `br_if` handling across modules is detected and managed accurately.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test_func
      (block (result i32)
        (br_if 0 (i32.const 1))
        (call $external_func)
        (i32.const 10)  ;; Excess stack value
      )
    )
  )
  "stack entropy detected"
)