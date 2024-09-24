;; 5. **Test Description**:    - **Scenario**: Call an imported function that internally invokes another export function, creating a nested call scenario.    - **Constraint**: Examine the handling of nested calls and validate stack consistency and control flow correctness.    - **Differential Check**: Verify proper stack unwinding and handling of nested `call` invocations in different WASM implementations.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32) (result i32)))
    (func $exported_func (export "exported_func") (param i32) (result i32)
      (call $imported_func (i32.const 5))
    )
    (func (call $exported_func (i32.const 10)))
  )
  "type mismatch"
)