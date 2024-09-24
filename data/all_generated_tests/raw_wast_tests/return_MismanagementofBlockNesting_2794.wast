;; 3. Create a scenario where a `br_table` causes a jump across various deeply nested blocks, followed by a `return`. This checks if after `br_table` runs, the return correctly exits the function from any frame in the nested structure.

(assert_invalid
  (module
    (func $br_table-across-nested-blocks (param i32) (result i32)
      (block (result i32)
        (block
          (block
            (block
              (block
                (br_table 0 1 2 3 4 (local.get 0))
                (return (i32.const 42))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)