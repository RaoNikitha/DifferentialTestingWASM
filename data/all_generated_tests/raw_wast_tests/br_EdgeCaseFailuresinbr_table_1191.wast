;; 2. Test a `br_table` instruction with a negative index, ensuring that the implementation correctly handles invalid negative indices and defaults or errors out appropriately. This checks handling of invalid index values.

(assert_invalid
  (module (func $test-br-table-negative-index 
    (block  
      (br_table -1 (i32.const 0)) 
    )
  ))
  "unknown label"
)