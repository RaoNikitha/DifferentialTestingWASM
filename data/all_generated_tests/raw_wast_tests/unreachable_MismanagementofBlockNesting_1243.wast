;; 4. Utilize `unreachable` in nested `block` and `loop` combinations with a `br_table` pointing to various nested block levels. Verifies that `br_table` accurately interprets block levels, ensuring correct trap handling within the nested context.

(assert_invalid
  (module
    (func $unreachable_nested_block_loop
      (block
        (loop
          (block 
            unreachable
            (br_table 0 1 2 (i32.const 2))
          )
          (i32.const 0)
        )
      )
    )
  )
 "type mismatch"
)