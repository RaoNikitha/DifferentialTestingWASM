;; 4. **Test Description:** Create a function with multiple nested `block`s, each containing their own `br_table` instructions. Manipulate the operand stack size to evaluate if deeper nested `br_table` instructions erroneously target outer blocks due to mismanaged block indexing.

(assert_invalid
  (module
    (func $nested-blocks
      (block (result i32)
        (block (result i32)
          (i32.const 1)
          (block (result i32)
            (i32.const 2)
            (block (result i32)
              (i32.const 3)
              (block (result i32)
                (i32.const 4)
                (block (result i32)
                  (i32.const 5)
                  (br_table 0 1 2 3 4 5 (i32.const 0))
                )
                (br_table 0 1 2 3 4 5 (i32.const 1))
              )
              (br_table 0 1 2 3 4 5 (i32.const 2))
            )
            (br_table 0 1 2 3 4 5 (i32.const 3))
          )
          (br_table 0 1 2 3 4 5 (i32.const 4))
        )
        (br_table 0 1 2 3 4 5 (i32.const 5))
      )
      (drop)
    )
  )
  "type mismatch"
)