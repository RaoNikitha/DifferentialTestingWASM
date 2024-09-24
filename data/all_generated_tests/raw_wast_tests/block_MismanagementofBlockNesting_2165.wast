;; 6. **Test 6**:    Use a complex nested structure with alternating blocks and loops, using `br_table` to exit different nesting depths. Validate if execution flow matches the intended depth. This tests if `br_table` correctly processes block depths in nested structures.

(assert_invalid
  (module
    (func $nested-blocks-br_table (result i32)
      (block (result i32)
        (loop
          (block (result i32)
            (i32.const 0)
            (i32.const 1)
            (br_table 0 1 2)
          )
        )
      )
    )
  )
  "type mismatch"
)