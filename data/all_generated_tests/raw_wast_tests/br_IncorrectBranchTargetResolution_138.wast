;; 9. **Chain of Blocks with Intermediate Branch:**    Create a sequence of `block` instructions, with each containing a `br` branch intended to jump out to increasingly outer `block` labels. This tests the correctness of incremental label indexing in the nesting.

(assert_invalid
  (module
    (func (block 
       (block
          (block
             (br 2)
          )
       )
    ))
  )
  "type mismatch"
)