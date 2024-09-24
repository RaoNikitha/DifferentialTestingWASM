;; 10. **Deeply Nested `nop` with Varied `br` Instructions:**    - **Description**: Create a deeply nested structure with multiple `nop` instances and varied `br` and `br_if`. Validate all branches resolve to correct labels.    - **Constraint Checked**: Tests deep nesting of `nop` and multiple branch instructions for correct label resolution.    - **Relation to Incorrect Branch Target Resolution**: Ensures complex nesting with `nop` does not cause incorrect branch target resolutions.

(assert_invalid
  (module
    (func $nested_nops
      (block $label0
        (nop)
        (block $label1
          (nop)
          (block $label2
            (nop)
            (br $label2)
            (nop)
          )
          (nop)
          (br_if $label1 (i32.const 1))
        )
        (nop)
        (br $label0)
      )
      (nop)
    )
  )
)