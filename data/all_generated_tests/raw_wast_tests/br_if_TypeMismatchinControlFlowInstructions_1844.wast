;; 5. **Test 5: Misaligned Conditional Operand Type**    - **Description**: Use `br_if` with a non-`i32` conditional operand (e.g., `f64`) to check branching feasibility.    - **Constraint Checked**: Both implementations must enforce that the conditional operand is an `i32`.    - **Relation to Type Mismatch**: Conditional operand must be of correct type for branching to function as intended.

(assert_invalid
  (module
    (func $misaligned-cond-operand-type
      (block $label_0
        (f64.const 1.0)
        (br_if $label_0)
      )
    )
  )
  "type mismatch"
)