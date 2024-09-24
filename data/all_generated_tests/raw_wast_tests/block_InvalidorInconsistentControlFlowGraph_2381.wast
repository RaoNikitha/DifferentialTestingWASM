;; 2. **Test Description**: Create a block with nested loops and an invalid `end` without matching `loop` instruction.    - **Constraint**: Ensure correct nesting of blocks and loops, with matching `end` instructions.    - **CFG Relation**: Tests if the CFG correctly handles nested structures and enforces proper bracketing.

(assert_invalid
  (module (func $nested-block-loop
    (block 
      (loop
        (end)
    ))
  ))
  "type mismatch"
)