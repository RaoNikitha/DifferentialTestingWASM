;; 4. **Test Description:**    - Implement a function with a nested block containing a `br_table` instruction that jumps to different blocks and has `return` in one of the target blocks.    - Ensure different blocks stack heights are distinct.    - This validates whether the `return` within a `br_table` correctly exits from the function rather than the br_table’s immediate blocks.    - **Specific Constraint:** Mismanagement of `br_table` induced block depth when encountering `return`.

(assert_invalid
  (module
    (func $nested-br-table-with-return (result i32)
      (block
        (block
          (block
            (br_table 0 1 2 (i32.const 0))
            (return (i32.const 42))
          )
          (drop) 
        )
        (i32.const 10)
      )
    )
  )
  "type mismatch"
)