;; 9. Test with a `block` containing a `br_table` where one of the indices branches to a non-existent `block`:    - A `br_table` inside the `block` directs one index to a non-existent block, expecting graceful failure.    - Specific Constraint: Checks for robust error handling and exception management for invalid references.    - Edge Case: Confirms that the implementation safely handles unresolved block references.

(assert_invalid
  (module
    (func $test_block_br_table_invalid
      (block
        (i32.const 0)
        (br_table 0 1 (i32.const 0))
      )
    )
  )
  "invalid branch index"
)