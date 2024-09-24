;; 2. **Test Imported Function with Incorrect Parameter Types**:    - **Description**: Call an imported function with parameters that do not match the expected types and observe if the implementation can handle the apparent type mismatch gracefully.    - **Constraint**: The calling module should trap or handle the error when parameter types do not match.    - **Relation**: Verifies proper error handling during type mismatches across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32 i32)))
    (func (call $external_func (i32.const 1) (f32.const 1.0)))
  )
  "type mismatch"
)