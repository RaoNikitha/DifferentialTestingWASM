;; 3. Test with nested `block` instructions, each containing `br_table` with varying valid and invalid indices:    - Two nested `blocks` each containing a `br_table`, with one block target index being out of range.    - Specific Constraint: Ensures proper context and stack management in nested scopes.    - Edge Case: Validates the outer and inner blocks’ handling of out-of-bounds and in-bounds indices correctly.

(assert_invalid
  (module 
    (func $test-nested-block-br_table (result i32)
      (block (result i32) 
        (block (result i32) 
          (br_table 2 1 (i32.const 3)) 
          (i32.const 0)
        ) 
        (i32.const 1)
      )
    )
  )
  "invalid block index"
)