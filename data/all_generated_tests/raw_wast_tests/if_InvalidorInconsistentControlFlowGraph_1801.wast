;; 2. **Test Name**: Incorrect Label Reference in Nested `if`    **Description**: Implement a scenario with nested `if` blocks, and insert a branch instruction that improperly targets a label outside the current context.    **Constraints Checked**: Correct context handling and label scope.    **CFG Issue**: Verifies that incorrect label referencing leads to validation errors in the CFG.

(assert_invalid
  (module
    (func
      (block
        (if (result i32)
          (i32.const 1)
          (then
            (if (result i32)
              (i32.const 1)
              (then (br 2))
              (else (i32.const 0))
            )
          )
          (else (i32.const 0))
        )
      )
    )
  )
  "unknown label"
)