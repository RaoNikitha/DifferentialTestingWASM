;; 2. **Test Description**: A `block` containing an `if` statement with a `br` instruction, where the branch targets the outer `block`.    **Reasoning**: Checks if the label stack correctly resolves a branch within a conditional statement to an enclosing block.

(assert_invalid
  (module (func $block-if-br (result i32)
    (block (result i32)
      (i32.const 1)
      (if (result i32)
        (i32.eqz (i32.const 0))
        (br 1) ;; should target the outer block
        (br 0) ;; should target the if statement itself
      )
    )
  ))
  "type mismatch"
)