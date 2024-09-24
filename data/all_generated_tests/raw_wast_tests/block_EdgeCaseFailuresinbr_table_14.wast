;; 5. Test the resilience of `br_table` by providing negative indices for branching within a block and observe how each implementation responds to invalid array index handling.

(assert_invalid
  (module (func
    (block (result i32) 
      (i32.const 10)
      (br_table -1 -2 (i32.const 0))
    )
  ))
  "invalid branch target"
)