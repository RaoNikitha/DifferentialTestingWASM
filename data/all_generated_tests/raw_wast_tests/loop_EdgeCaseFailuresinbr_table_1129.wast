;; 10. **Test Description**:     - Formulate a loop with a `br_table` entry list treated as immutable, and attempt to dynamically pass indices that should increment beyond initialized capacities.     - Verify index handling and capacity checks.     - This tests for dynamic index bounds and correct handling of capacity limits.     -

(assert_invalid
  (module
    (func $dynamic-br-table
      (block
        (loop
          (block
            (br_table 0 1 (i32.const 2))
          )
        )
      )
    )
  )
  "br_table index out of range"
)