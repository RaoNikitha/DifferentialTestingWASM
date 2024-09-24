;; 2. **Test Description**: Define a `block` containing multiple nested blocks with a `br_table` that should target an outer block using the maximum possible index value.    - **Constraint**: The `br_table` should correctly resolve the maximum index to the appropriate label of the outer block.    - **Edge Case**: This test investigates the implementation’s ability to manage label resolution for the maximum index and check if the index value is handled correctly.

(assert_invalid
  (module (func $test-br-table-max-index
    (block (result i32) 
      (block 
        (block 
          (block
            (block
              (br_table 4 (i32.const 0))
            )
          )
        )
      )
    )
  ))
  "invalid label index"
)