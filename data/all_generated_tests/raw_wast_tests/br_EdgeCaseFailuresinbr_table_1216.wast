;; 7. **Test Description**: Create a `br_table` inside an `if` block, with an index that invalidly targets outside the `if` block’s labels confirming fallback onto the default label.    - **Constraint**: Ensures the `br_table` handles labels within the local context of the `if` correctly and defaults to the correct label on invalid index.    - **Edge Case Relation**: Verifies scoped label management within conditional blocks.

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (then
          (br_table 0 1 (i32.const 1) (i32.const 0))
        )
      )
    )
  )
  "unknown label"
)