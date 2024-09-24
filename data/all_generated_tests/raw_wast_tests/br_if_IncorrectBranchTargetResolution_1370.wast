;; 1. **Test Description 1: Nested Block Misreferencing**    - Create a function with nested `block` instructions. Use `br_if 0` within the innermost block to check if it properly exits to the correct block.

(assert_invalid
  (module
    (func (block (block (br_if 0 (i32.const 1)))))
  )
  "type mismatch"
)