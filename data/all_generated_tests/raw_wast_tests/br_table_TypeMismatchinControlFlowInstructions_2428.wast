;; 8. Test Description 8: Develop a test where a block containing a `br_table` instruction targets several labels, one of which requires more operands than are available on the stack at branch time.

(assert_invalid
  (module (func
    (block (result i32)
      (block 
        (i32.const 0) 
        (br_table 0 1 1 (i32.const 0))
      ) 
      (i32.const 1)
    )
  ))
  "type mismatch"
)