;; 5. Test with a `block` where `br_table` targets another nested `block`:    - The `br_table` in the outer `block` targets labels including one from an inner `block`, testing cross-scope branching.    - Specific Constraint: Examines stack space consistency handling across multiple nested levels.    - Edge Case: Verifies proper label tracking and index calculation across nested contexts.

(assert_invalid
  (module 
    (func $br_table_nested_blocks
      (block $outer_block
        (block $inner_block
          (br 0)
        )
        (block $another_block
          (br_table 0 1 2 (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)