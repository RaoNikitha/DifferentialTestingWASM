;; 7. **Test: Repeated Label in Inner and Outer Blocks**:    - **Description**: Have `if` instructions where an inner block reuses a label index used by an outer `if` block.    - **Constraint**: Enforces unique and correctly scoped label validation.    - **Relation to Branch Target Resolution**: Inspects if branching mechanisms can differentiate duplicate labels in nested scopes.

(assert_invalid
  (module (func $test-repeated-label
    (block $outer
      (if (result i32) (i32.const 1)
        (then
          (block $inner
            (br $outer)
          )
          (i32.const 1)
        )
        (else
          (block $outer
            (br $outer)
          )
          (i32.const 1)
        )
      )
    )
  ))
  "invalid branch target"
)