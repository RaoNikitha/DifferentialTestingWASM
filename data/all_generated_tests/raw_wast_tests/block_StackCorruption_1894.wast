;; 5. **Test Description**: Design a sequence with deeply nested blocks, where each block manipulates the stack differently and ends early with `br_table`. This ensures that the stack integrity is preserved across complex control flows and indices are correctly managed without corruption.

(assert_invalid
  (module 
    (func $deeply_nested_blocks
      (block (result i32)
        (block 
          (block (result i32)
            (i32.const 1)
            (br_table 0 1) 
            (i32.const 2)
          )
          (i32.const 3)
        )
        (i32.const 4)
      )
    )
  )
  "type mismatch"
)