;; 9. **Test Description**:    - **Scenario**: Export a function that calls another exported function recursively from an importing module.    - **Constraint**: Check for proper handling of recursive calls and the stack’s integrity across module boundaries.    - **Differential Check**: Validate the correctness of recursive calls in handling control flow between exports in both implementations.

(assert_invalid
  (module
    (func $recursive_caller (result i32) (call $recursive_callee))
    (func (export "recursive_function") (result i32) (call $recursive_caller))
    (func $recursive_callee (result i32) (call $recursive_caller))
  )
  "recursive call stack overflow"
)