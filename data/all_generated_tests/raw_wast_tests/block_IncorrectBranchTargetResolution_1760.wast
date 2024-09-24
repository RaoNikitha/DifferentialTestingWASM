;; 1. A test where a block contains a `br` instruction with a label index of 0, ensuring it correctly branches to the end of the current block. This checks whether the branch correctly resolves the innermost block's label.

(assert_invalid
  (module (func $branch-within-block
    (block (result i32) (br 0 (i32.const 1)))
    (i32.const 2)
  ))
  "type mismatch"
)