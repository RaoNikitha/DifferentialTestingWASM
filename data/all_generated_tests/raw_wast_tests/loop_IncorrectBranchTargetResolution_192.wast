;; 3. Implement a loop with multiple nested `if-else` blocks that contain `br_table` instructions targeting different loop levels. The test should ensure that the branch table resolves to the correct loop based on the index provided, testing label and context correctness.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (i32.const 1)
        (block (result i32)
          (block (result i32)
            (i32.const 0)
            (br_table 0 1 2) ; test incorrect br_table targeting different levels
          )
        )
        (drop)
      )
    )
  )
  "type mismatch"
)