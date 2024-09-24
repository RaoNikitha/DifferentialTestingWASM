;; 4. **Variable Depth Conditional Branch Test**:    - **Description**: Establish several `block` structures, then use a `br_if` that depends on different conditional operands and targets different depths in various iterations. This tests correct branching relative to various depths.    - **Constraint Checked**: Operand Stack, Relative Label Lookup.    - **Expected Failure**: wizard_engine could fail with an `EmptyValueStackExpecting` error due to incorrect stack unwinding for varied depths.

(assert_invalid
  (module
    (func $variable_depth_conditional_branch
      (block $outer
        (block $middle
          (block $inner
            (br_if 2 (i32.const 1))  ;; Should branch to $outer
            (br_if 1 (i32.const 1))  ;; Should branch to $middle
            (br_if 0 (i32.const 1))  ;; Should branch to $inner
          )
        )
      )
    )
  )
  "type mismatch"
)