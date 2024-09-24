;; 4. **Deeply Nested Block Branch Targets**:    - Construct a deeply nested set of blocks, each containing `br` instructions targeting different block levels. Include conditions to vary the branch target dynamically using `br_if`.    - **Constraint**: Correctly handle conditions-based branching to different nesting depths, ensuring proper label resolution under dynamic conditions.    - **Focus**: Tests label indexing accuracy with variable condition-based branches within deeply nested blocks.

(assert_invalid
  (module
    (func $deeply_nested_blocks
      (block $L0
        (block $L1
          (block $L2
            (block $L3
              (i32.const 1) 
              (br 3)
              (block
                (br_if 2 (i32.const 0))
              )
              (block
                (br_if 1 (i32.const 1))
              )
              (block
                (br_if 0 (i32.const 1))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)