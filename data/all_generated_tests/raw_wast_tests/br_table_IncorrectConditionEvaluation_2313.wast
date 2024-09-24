;; 3. Create a nested structured block where `br_table` is the innermost block. Test with an operand that should hit the third label. Check if the branch condition is misinterpreted as the first (default) label.

(assert_invalid
  (module
    (func
      (block 
        (block 
          (block 
            (br_table 0 1 2 (i32.const 3))
          )
        )
      )
    )
  )
  "unknown label"
)