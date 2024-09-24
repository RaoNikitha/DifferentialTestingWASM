;; 9. **Test Description:**    - Place a `br_if` within a complex nested structure where the condition involves a hierarchy of comparison checks combining both equality and inequality of operand stack results.    - **Constraint Checked:** Multi-level condition evaluation accuracy.    - **Test Relation:** Ensures nested condition complexity is correctly handled for branching purposes.

(assert_invalid
  (module
    (func $complex_nested_branch
      (block (result i32)
        (block
          (if (result i32)
            (i32.eqz (i32.const 0))
            (then
              (if (result i32)
                (i32.ne (i32.const 1) (i32.const 2))
                (then
                  (br 1)
                )
                (else
                  (i32.const 1)
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
  )
  "type mismatch"
)