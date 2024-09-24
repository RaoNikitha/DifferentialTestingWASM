;; 1. Test a `br_table` with indices falling exactly at the boundary of valid target ranges within a block, ensuring that both implementations correctly branch to the last valid target.

(assert_invalid
  (module (func $br_table-boundary (result i32)
    (block (result i32)
      (block 
        (block 
          (br_table 0 1 2 (i32.const 3))
          (i32.const 0)
        )
        (i32.const 1)
      )
      (i32.const 2)
    )
  ))
  "br_table index out of range"
)