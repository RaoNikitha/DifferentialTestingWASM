;; 6. A test where a block within another block has its label used by a `br_if` instruction from the outer block, challenging the label accessibility constraints and ensuring labels are not incorrectly resolved outside their scope.

(assert_invalid
  (module (func $block_br_if_outer_scope
    (block (result i32)
      (block (result i32) (br_if 1 (i32.const 1) (i32.const 2))) (i32.const 3)
    )
  ))
  "type mismatch"
)