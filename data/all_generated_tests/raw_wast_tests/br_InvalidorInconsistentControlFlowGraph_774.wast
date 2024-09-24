;; 5. **Mismatched Operand Stack Types:**    - Create a scenario where the `br` instruction’s operation stack height and types do not match the target block’s expected types.    - Reasoning: Ensures proper reconciliation of operand stack types and sizes when branching.    - Relation to CFG: Incorrect type handling can invalidate paths in the CFG, causing mismatches and runtime errors.

(assert_invalid
  (module (func $test-mismatched-operand-stack-types
    (block (result i32)
      (i32.const 1)
      (i64.const 0)
      (br 0)
    )
  ))
  "type mismatch"
)