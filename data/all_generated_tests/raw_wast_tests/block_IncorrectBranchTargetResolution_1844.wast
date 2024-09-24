;; 5. **Branch to Enclosing Block**:    - Create a scenario where a `block` contains another block, and the inner block has a `br` instruction pointing to the outer block. Verify correct transfer of control to the outer block's `end`.    - **Constraint**: Branching out of an inner block to an outer block should correctly handle the stack and resume execution at the outer block's end.    - **Focus**: Tests resolving branches that skip nested levels of blocks.

(assert_invalid
  (module (func $nested-blocks
    (block (result i32) 
      (block 
        (br 1))
      (i32.const 0))
  ))
  "type mismatch"
)