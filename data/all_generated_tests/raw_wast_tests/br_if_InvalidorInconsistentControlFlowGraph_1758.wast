;; 9. **Test Description: Loop Input Type Mismatch**    - **Reasoning**: Operand stack sequence `[t*]` required by a loop's input type must match when branching back to it.    - **Constraint Checked**: Input type validation for loop backward jumps.    - **Inconsistent CFG**: Failure to validate input types for backward jumps leads to operand inconsistencies.    - **Expected Differential Behavior**: WASM gives a generic type error, while wizard_engine catches it with `EmptyValueStackExpecting` for mismatches.

(assert_invalid
  (module
    (func (loop (result i32) (br_if 0 (i32.const 1) (i32.const 2))))
  )
  "type mismatch"
)