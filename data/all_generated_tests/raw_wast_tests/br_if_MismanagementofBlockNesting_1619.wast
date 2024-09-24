;; 10. **Test br_if from Deeply Nested If Conditions to Verify Label Interpretation**:     Develop a complex structure where several `if` conditions use `br_if` to jump to various levels of the parent blocks. Ensure correct alignment of stack states in each `if` condition and verify stack height at each proper control transfer point.

(assert_invalid
  (module
    (func $deeply_nested_br_if
      (block $outer (result i32)
        (block $middle (result i32)
          (block $inner (result i32)
            (if (i32.const 1)
              (then
                (if (i32.const 1)
                  (then
                    (br_if 2 (i32.const 1))
                  )
                )
              )
            )
            (i32.const 0)
          )
        )
      )
    )
  )
  "type mismatch"
)