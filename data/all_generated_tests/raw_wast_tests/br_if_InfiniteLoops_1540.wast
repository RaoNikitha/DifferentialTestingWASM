;; 1. **Test Description**: Create a deeply nested control structure where `br_if` is used to conditionally break out of multiple layers. The test should ensure the correct relative lookup of labels. Misinterpretation could cause an infinite loop if the label is incorrectly referenced and `br_if` does not break out as intended.    - **Constraint Checked**: Relative label lookup mechanism and label indexing.    - **Relation to Infinite Loops**: An incorrect label can cause the condition to never exit the intended loop layer, hence causing an indefinite execution.

(assert_invalid
  (module
    (func $test-deeply-nested-br_if
      (block
        (block
          (block
            (block
              (block
                (block
                  (br_if 10 (i32.const 1))
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)