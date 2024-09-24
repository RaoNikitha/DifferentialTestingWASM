;; 4. **Incorrect Label Propagation within Deeply Nested Blocks**:    - Design a deeply nested `if-else` structure to verify if the label propagation for branches is correctly handled. The inner blocks can have branch instructions referring to incorrect labels.    - *Constraint*: Labels and context should be correctly propagated and managed in nested blocks.    - *Relation to CFG*: Ensures the CFG correctly handles label scopes and propagation within nested control flows.

(assert_invalid
  (module
    (func $deeply_nested_label_propagation
      (block $outer
        (if (i32.const 1)
          (then
            (block $inner
              (if (i32.const 1)
                (then
                  (br $outer)
                  (i32.const 0)
                )
                (else
                  (br $inner)
                )
              )
            )
          )
          (else
            (i32.const 0)
          )
        )
      )
    )
  )
  "invalid label"
)