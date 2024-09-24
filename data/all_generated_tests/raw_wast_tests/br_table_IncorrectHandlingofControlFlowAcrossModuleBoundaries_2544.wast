;; 3. **Nested Blocks with Backward Branch Involving Imported Function**:    - Test Description: Define deeply nested blocks where `br_table` includes backward branches that involve calls to imported functions. The backward jump should uphold the operand inputs expected by the target block and handle returns properly.    - Constraint: Tests backward branching compliance with input types, operand stack unrolling, and handling execution flow returns from imported functions.    - Differential Reasoning: Mismanagement of backward branch handling in `wizard_engine` can be exposed by nested imports leading to operand inconsistencies.

(assert_invalid
  (module
    (func $imported (import "env" "imported_func") (param i32) (result i32))
    (func $type-check-backward-branch
      (block $outer
        (block $inner
          local.get 0
          br_table 1 0
          call $imported
          nop
        )
      )
    )
  )
  "type mismatch"
)