;; 7. **Test Case 7**: Scenario with deeply nested control instructions where an invalidly indexed `br_if` is placed, ensuring it correctly targets existing labels.    - **Constraint Checked**: Relative label lookup management with deep nesting.    - **CFG Relation**: Unreachable or incorrectly reachable blocks due to misaligned label references.

(assert_invalid
  (module
    (func $nested-br_if (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (block (result i32)
                  (block (result i32)
                    (br_if 7 (i32.const 1))
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)