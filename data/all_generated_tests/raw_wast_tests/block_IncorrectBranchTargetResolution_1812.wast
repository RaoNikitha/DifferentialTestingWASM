;; 3. **Test Description**: Implement a block with an inner loop and a `br_table` to branch to different labels based on a runtime computed index. Observe if the resolution of branch targets matches the expected labels in the nested block structure.

(assert_invalid
  (module
    (func $type-br-table-nested-blocks (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_table 0 1 2 (local.get 0))
          )
          (i32.const 42)
        )
        (i32.const 84)
      )
    )
  )
  "type mismatch"
)