;; 1. **Call Imported Function with Mismatched Argument Types**:    Test a scenario where a WebAssembly module imports a function and calls it with arguments that don't match the expected types. This should trigger a stack type mismatch error in the wizard_engine due to its strict `popE` type checking, but may not in the WebAssembly implementation if it doesn’t enforce type checks as explicitly.

(assert_invalid
  (module
    (import "env" "external_func" (func $external (param i32)))
    (func $test_func
      (call $external (f64.const 3.14))
    )
  )
  "type mismatch"
)