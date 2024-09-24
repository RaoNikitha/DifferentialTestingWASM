;; 10. **Conditional Branch with Type Stack Mismatch**:     - **Description**: Use `br_if` to branch to an `else` block expecting `[i32, f64]`, but the stack only contains `[i32]`.     - **Constraint**: Ensures stack types match control structures during conditional branching.     - **Differential Behavior**: WASM should catch the stack type mismatch, wizard_engine might improperly manage operand stack references.

(assert_invalid
  (module
    (func $conditional_branch_stack_mismatch
      (block (else (br_if 0 (i32.const 1)) (i32.const 1) (f64.const 2.0)) (i32.const 3))
    )
  )
  "type mismatch"
)