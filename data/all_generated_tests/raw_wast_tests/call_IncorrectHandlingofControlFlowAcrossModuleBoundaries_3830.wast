;; 9. **Indirect Function Calls Across Modules**:    - **Description**: Perform indirect function calls via a table where functions from different modules are indirectly called and validate that the correct function is executed.    - **Constraint**: Indirect calls must reference the correct function index.    - **Relation**: Verifies that the call instruction handles indirect calls properly across module boundaries.

(assert_invalid
  (module
    (import "moduleA" "funcA" (func $funcA (param i32) (result i32)))
    (import "moduleB" "funcB" (func $funcB (param i64) (result i64)))
    (table 2 funcref)
    (elem (i32.const 0) $funcA $funcB)
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i64)))
    (func $test
      (i32.eq (call_indirect (type 0) (i32.const 42) (i32.const 0)) (i64.eqz (call_indirect (type 1) (i64.const 42) (i32.const 1))))
    )
    (export "test" (func $test))
  )
  "type mismatch"
)