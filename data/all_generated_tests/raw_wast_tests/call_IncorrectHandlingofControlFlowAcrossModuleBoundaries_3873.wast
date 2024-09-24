;; 2. **Nested Calls Across Modules**:    - **Constraint Checked**: Examines nested function calls between modules.    - **Description**: Implement a scenario where a function in module A calls a function in module B, which in turn calls back to another function in module A. Validate proper stack handling and return to the correct call frame across module boundaries.

(assert_invalid
  (module
    (import "module_a" "func_a" (func $func_a (param i32) (result i32)))
    (func $module_b_func (result i32)
      (call $func_a (i32.const 5))
    )
    (export "module_b_func" (func $module_b_func))
  )
  "type mismatch"
)