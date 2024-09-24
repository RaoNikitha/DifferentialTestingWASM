;; 6. **Complex Loop with Multiple Branches to Unreachable**:    - Design a loop with multiple branches (`br`, `br_if`) and internal blocks that lead to an `unreachable` instruction. Use convoluted control flow to simulate potential pitfalls.    - **Constraint**: Validates the handling of multiple branches within a loop block, ensuring proper execution without reaching `unreachable`.    - **Unreachable Code Execution**: Makes certain that complex branch logic within loops does not accidentally hit `unreachable`.

(assert_invalid
  (module (func $complex-loop-with-branches (result i32)
    (loop $start (result i32)
      (block $b1 (br_if $b1 (i32.const 0) (unreachable)))
      (block $b2 (br_if $start (i32.const 1)))
      (i32.const 1)
    )
  ))
  "unreachable"
)