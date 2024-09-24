;; 1. **Test with Nested Blocks and No Operation Instructions**:    - Create a sequence of nested blocks where each block contains multiple `nop` instructions. Validate that exiting the correct block maintains proper control flow.    - This test checks if `nop` within nested blocks causes mismanagement of block depth and control flow.

(assert_invalid
  (module
    (func (block (block (block (nop) (nop) (nop)))))
  )
  "invalid block depth exit"
)