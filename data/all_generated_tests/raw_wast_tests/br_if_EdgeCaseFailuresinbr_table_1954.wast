;; Test 5: Use `br_table` within a complex block structure containing multiple nested blocks and loops, intentionally setting an index out of sync with the label stack, testing the invalid control transfer handling.

(assert_invalid
  (module (func $complex_block_structure
    (block 
      (loop 
        (block 
          (block 
            (br_table 1 2 3 (i32.const 0))
          )
        )
      )
    )
  ))
  "invalid control transfer"
)