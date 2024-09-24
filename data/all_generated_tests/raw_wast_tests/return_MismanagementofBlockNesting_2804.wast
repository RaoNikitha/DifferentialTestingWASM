;; 3. Design a test that includes a `br_table` spanning multiple nested blocks with a `return` instruction placed in one of the destinations to ensure that the correct block context is maintained across complicated branching scenarios. This verifies the correct identification of return paths for each block depth.

(assert_invalid
  (module
    (func $br_table_with_return 
      (block 
        (block 
          (br_table 0 1 (return))
        )
      )
    )
  )
  "type mismatch"
)