;; 1. **Test: Misnested Blocks and Unreachable Instruction**    - **Description:** Define a function with nested `block` structures, where an `unreachable` instruction is placed inside a nested block. Include a branch instruction (`br`) outside any blocks. This will test if the `unreachable` is causing a trap correctly irrespective of the block nesting.    - **Constraint Checked:** Verifies the correct placement and execution of `unreachable` within nested blocks.    - **Relation to Mismanagement of Block Nesting:** Ensures proper management and resolution of nested blocks in the presence of `unreachable`.

(assert_invalid
  (module (func $misnested-blocks-unreachable
    (block
      (block
        (unreachable)
      )
      (br 0)
    )
  ))
  "type mismatch"
)