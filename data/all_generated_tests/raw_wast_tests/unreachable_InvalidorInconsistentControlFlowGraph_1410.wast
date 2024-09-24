;; 1. **Test Description:** Place the `unreachable` instruction inside a block, immediately followed by another instruction. This tests how the CFG handles the premature termination of the block due to the `unreachable` instruction, ensuring proper trapping without executing follow-up instructions.    - **Constraint:** Consistent trap behavior in blocks.    - **Relation to CFG:** Checks for correct CFG termination and trap propagation within blocks.

(assert_invalid
  (module (func $unreachable-in-block
    (block
      unreachable
      (i32.const 42)
    )
  ))
  "type mismatch"
)