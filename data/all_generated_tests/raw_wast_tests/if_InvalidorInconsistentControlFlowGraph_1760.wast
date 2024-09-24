;; 1. **Mismatched Block Types across Nested `if` Instructions**:    - Test for a scenario where nested `if` blocks have mismatched block types, potentially causing the CFG to incorrectly identify valid branches. Check for cases where block types in the `then` section do not match the `else` section, leading to inconsistent branch handling.    - *Constraint*: Ensures nested block types are validated and matched correctly.    - *Relation to CFG*: Evaluates how the CFG manages nested and mismatched blocks within `if` statements.

(assert_invalid
  (module
    (func
      (i32.const 1)
      (if (result i32)
        (then 
          (if (result f32)
            (then (f32.const 0.0))
            (else (f32.const 1.0))
          )
        )
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)