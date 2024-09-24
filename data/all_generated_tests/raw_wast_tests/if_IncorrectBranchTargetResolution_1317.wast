;; 8. **Test: Excessive Nesting Depth**:    - **Description**: Create a deeply nested `if` block structure where inner blocks target labels assuming incorrect nesting levels.    - **Constraint**: Confirms validator handles excessive nesting accurately through boundary checks.    - **Relation to Branch Target Resolution**: Tests validator’s handling of deeply nested blocks ensuring correct label depth resolution.

(assert_invalid
  (module (func $excessive-nesting
    (if (result i32) (i32.const 1)
      (then
        (if (result i32) (i32.const 1)
          (then
            (if (result i32) (i32.const 1)
              (then
                (if (result i32) (i32.const 1)
                  (then
                    (if (result i32) (i32.const 1)
                      (then
                        (if (result i32) (i32.const 1)
                          (then
                            (br 10)
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  ))
  "invalid label"
)