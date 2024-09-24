;; 9. **Non-terminating Blocks with Complex Nesting**:    Test with deeply nested blocks where the `br_table` needs to branch outward correctly, ensuring proper control flow management in complex nested constructs.

(assert_invalid
  (module
    (func (result i32)
      (block
        (block
          (block
            (br_table 0 2 1 (i32.const 0))
          )
        )
        (br_table 0 3 (i32.const 1))
      )
    )
  )
  "unknown label"
)