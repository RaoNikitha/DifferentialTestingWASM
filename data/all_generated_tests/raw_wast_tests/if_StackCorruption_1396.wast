;; 7. **Nesting `if` Instructions Incorrectly**:    - **Focus**: Nested control instruction stack management.    - **Description**: Nest multiple `if` instructions improperly so that inner blocks disrupt the stack structure expected by outer blocks. Check consistency in stack behavior across implementations.

(assert_invalid
  (module
    (func $nested-ifs-incorrectly
      (i32.const 1)
      (if
        (then
          (i32.const 2)
          (if
            (then
              (i32.const 3)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)