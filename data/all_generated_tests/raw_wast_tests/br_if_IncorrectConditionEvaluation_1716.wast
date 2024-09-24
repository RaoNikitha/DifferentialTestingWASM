;; 7. **Test Description**: Place a `br_if` instruction at the end of a function within a `block`. Use a non-zero condition to test that the function returns early, breaking out of the block.

(assert_invalid
 (module
  (func (result i32)
   (block (result i32)
    (br_if 0 (i32.const 1))
    (i32.const 42)
   )
  )
 )
 "type mismatch"
)