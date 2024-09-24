;; 1. **Test Description**: Implement a `call_indirect` in a function where the dynamic type of the function in the table does not match the function type expected. The target function signature expects an `i32` input but the indirect call provides an `f64` input.    - **Constraint**: Ensures that any dynamic type checking failure triggers a trap.    - **Relation**: Checks the robustness of type mismatch handling during control flow execution.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $target (param i32))
    (table funcref (elem $target))
    (func $test
      (call_indirect (type 0) (f64.const 42.0) (i32.const 0))
    )
  )
  "type mismatch"
)