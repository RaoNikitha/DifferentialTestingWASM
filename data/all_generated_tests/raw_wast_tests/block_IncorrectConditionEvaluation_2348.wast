;; 9. Set up a block containing non-trivial logic operations like bitwise AND, OR within `br_if` conditions. Check if the evaluated conditions within `br_if` are correctly determined to influence whether the control breaks out of the block.

(assert_invalid
  (module (func $block-with-logic (result i32)
    (block (result i32)
      (i32.const 1)
      (i32.const 2)
      (i32.and)
      (br_if 0 (i32.const 0))
      (i32.const 3))
  ))
  "type mismatch"
)