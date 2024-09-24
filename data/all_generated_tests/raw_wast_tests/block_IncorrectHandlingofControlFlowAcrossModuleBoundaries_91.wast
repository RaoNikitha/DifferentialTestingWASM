;; 2. **Test export block handling**:    - Implement a block within an exported function that involves multiple instructions and verify the correct result type upon returning to the calling module.    - Ensure that branching within the block doesn't result in stack corruption when the function is exported and called from another module.

(assert_invalid 
  (module 
    (func $test_block_export (export "test_func") (result i32) 
      (block (result i32) 
        (br 0 (i64.const 10)) 
        (i32.const 10)
      )
    )
  )
  "type mismatch"
)