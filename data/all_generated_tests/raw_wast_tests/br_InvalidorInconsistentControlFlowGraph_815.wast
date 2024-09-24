;; 6. **Test Description**: Include an `if` construct that branches with a `br` targeting an invalid nested block that does not exist at runtime.    - **Constraint**: This test ensures correct conditional branching and that the CFG correctly handles invalid branches preventing misaligned execution paths.

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (then (br 2))
      )
    )
  )
  "unknown label"
)