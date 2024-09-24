;; 8. **Test Name**: Branching in `then` without Matching Context in `else`    **Description**: Construct an `if` block where the `then` block contains branches that affect the stack, but the `else` block does not account for these changes.    **Constraints Checked**: Consistent stack state between `then` and `else`.    **CFG Issue**: Identifies inconsistencies in how branch instructions are interpreted within the CFG.

(assert_invalid
  (module (func $branch-in-then-without-matching-context
    (if (result i32)
      (i32.const 1)
      (then
        (br 0)
        (i32.const 1)
      )
      (else
        (i32.const 0)
      )
    )
  ))
  "type mismatch"
)