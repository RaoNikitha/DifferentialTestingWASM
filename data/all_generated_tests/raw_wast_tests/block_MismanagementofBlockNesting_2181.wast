;; 2. **Deeply Nested Blocks with `br_table`**:    - Create a deeply nested structure of `block` instructions with a `br_table` inside the innermost block. The `br_table` should branch to multiple depths. Validate that the `br_table` correctly determines the block depth and exits to the appropriate block level. Incorrect depth calculations may cause unexpected block exits.

(assert_invalid
  (module
    (func $deeply_nested_br_table (result i32)
      (block
        (block
          (block
            (block
              (block
                (br_table 0 1 2 3 4 4 (i32.const 2))
              )
            )
          )
        )
      )
      (i32.const 42)
    )
  )
  "type mismatch"
)