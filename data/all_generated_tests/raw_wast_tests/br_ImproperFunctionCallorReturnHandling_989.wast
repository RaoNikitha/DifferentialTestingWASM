;; 10. **Test: Return from Function with Type Transformation**    - **Description**: Create a function that performs type transformations of values on the stack. At return, use `br` to jump to a label requiring different operand types, ensuring the transformed types conform to expectations.    - **Constraint Checked**: Validates type correctness after transformations and correct branching to labels with type requirements.    - **Improper Handling Aspect**: Transformations causing type mismatches on the stack, leading to invalid branch operations.

(assert_invalid
  (module
    (func $type-mismatch-after-transformation
      (block $label_main
        (block $label_inner
          (f64.const 3.14)
          (br 0)
        )
        (i32.const 42)
        (br $label_main)
      )
    )
  )
  "type mismatch"
)