;; 8. **Test Description: Branch Result Type Mismatch**    - **Reasoning**: The operand stack must provide a sequence `[t*]` matching the result type of the branch target.    - **Constraint Checked**: Result type validation on branch targets (forward jumps).    - **Inconsistent CFG**: CFG does not validate result types properly, causing type mismatches.    - **Expected Differential Behavior**: WASM flags a generic operand type error, whereas wizard_engine reports `EmptyValueStackExpecting` for type mismatches.

(assert_invalid
  (module (func $branch-result-type-mismatch (result i32)
    (block (result i32) (br_if 0 (i64.const 1)) (i32.const 1))
  ))
  "type mismatch"
)