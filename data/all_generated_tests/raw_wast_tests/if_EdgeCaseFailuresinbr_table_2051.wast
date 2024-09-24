;; 2. **Out-of-Bounds Index Handling in `br_table`**:    - Write a test where an index provided to a `br_table` within an `if` block exceeds the number of available labels. Such a test will check whether the additional initialization in the wizard engine affects edge case handling, potentially causing different error handling than in WebAssembly.

(assert_invalid
  (module
    (func $out_of_bounds_br_table
      (i32.const 0)
      (if (result) (i32.const 1)
        (then 
          (block 
            (br_table 1 2 (i32.const 2))
          )
        )
      )
    )
  )
  "branch out of bounds"
)