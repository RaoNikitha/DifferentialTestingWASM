;; 9. **Test for Invalid Forward Branch Type**: Implement a forward branch to an `if` block that expects a specific result type such as `f64`. Attempt to branch with an incorrect result type like `i32` on the stack to check type enforcement consistency.

(assert_invalid
  (module
    (func $invalid_forward_branch_type
      (block (result f64)
        (if (result f64) (i32.const 1) (then (br 0 (i32.const 1))))
      )
    )
  )
  "type mismatch"
)