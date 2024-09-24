;; 3. **Test 3**: Implement a `br_table` instruction that conditionally breaks out from various levels of nested blocks, incorporating a `call` in each block with varying function signatures. Check if jumping between blocks maintains correct type consistency across different engines.

(assert_invalid
  (module
    (func $nested-blocks
      (block (block (block 
        (br_table 0 1 2 (call 0 (i32.const 1)))
      )))
    )
    (func (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
  )
  "type mismatch"
)