;; 2. Create a block with multiple branching points (`br` and `br_if`) targeting different blocks at varying depths, making sure each branch leads to valid and expected end points. This tests label stack manipulation and ensures that branches align correctly with the CFG.

(assert_invalid
  (module (func $block-multiple-branches 
    (block (result i32)
      (br 0 (i32.const 1))
      (br_if 1 (i32.const 2))
      (unreachable)
    )
  ))
  "type mismatch"
)