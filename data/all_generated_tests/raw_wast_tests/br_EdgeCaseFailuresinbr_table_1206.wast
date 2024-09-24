;; 7. Develop a `br_table` test that combines targets referring to both `if-then-else` blocks and `loops`, with indices interchanging between them. This ensures labels are correctly managed within mixed structured control instructions.

(assert_invalid
  (module
    (func $mixed-br_table
      (block (result i32)
        (loop (result i32)
          (block
            (i32.const 0)
            (i32.const 1)
            (br_table 1 0 (i32.const 2))
          )
          (i32.const 3)
        )
      )
    )
  )
  "type mismatch"
)