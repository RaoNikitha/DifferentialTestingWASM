;; 4. **Test Name**: Invalid Forward Branch in `if`    **Description**: Place a branch instruction within an `if` block that attempts to jump forward to an instruction outside the block's boundaries.    **Constraints Checked**: Block boundaries and valid forward branching.    **CFG Issue**: Checks that the CFG correctly enforces block boundaries without allowing invalid forward branches.

(assert_invalid
  (module (func $invalid-forward-branch
    (if (i32.const 1)
      (then (br 1))
    )
  ))
  "invalid branch results in type mismatch"
)