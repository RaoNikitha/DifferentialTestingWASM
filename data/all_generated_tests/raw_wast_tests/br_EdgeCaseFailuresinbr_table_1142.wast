;; 3. **Test Description 3:**    Implement a `br_table` where one of the target labels points to a deeply nested block structure. This will test how each engine handles complex nested control flows when performing indirect branches.

(assert_invalid
  (module (func $complex-nested-br_table
    (block
      (block
        (block
          (block
            (i32.const 0)
            br_table 3 2 1 0 (i32.const 0)
          )
        )
      )
    )
  ))
  "type mismatch"
)