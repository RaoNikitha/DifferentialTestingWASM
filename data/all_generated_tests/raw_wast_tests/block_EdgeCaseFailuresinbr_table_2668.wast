;; Create a complex scenario with deeply nested blocks and multiple `br_table` instructions. Each target index in the `br_table` points to labels in different blocks. This tests the implementation’s capacity to resolve label scope and indices correctly in deeply nested contexts.

(assert_invalid
  (module (func $deep-nested-br_table
    (block (result i32)
      (block
        (block (result i32)
          (block
            (block
              (br_table 2 1 0 (i32.const 0))
            )
            (i32.const 1)
          )
          (i32.const 2)
        )
      )
    )
  ))
  "type mismatch"
)