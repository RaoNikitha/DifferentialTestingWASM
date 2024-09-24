;; 7. **Test Case: Unreachable Inside Block Instruction**    - Description: Embed `unreachable` within a `block` instruction to see if the block's execution is halted early.    - CFG Constraint: Ensuring that the execution of instructions within a block is correctly interrupted, resulting in an immediate trap.

(assert_invalid
  (module (func $unreachable-inside-block
    (block
      (unreachable)
      (i32.const 1)
      (drop)
    )
  ))
  "type mismatch"
)