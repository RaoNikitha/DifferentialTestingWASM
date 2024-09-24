;; Test Description 5: A `block` with a `br_if` instruction that tests for an equality operation involving a non-zero constant. Validate whether the branch is correctly conditional upon the equality operation.

(assert_invalid
 (module
  (func (result i32)
   (block (result i32)
    (br_if 0 (i32.eq (i32.const 5) (i32.const 5))) (i32.const 1)
   )
  )
 )
 "type mismatch"
)