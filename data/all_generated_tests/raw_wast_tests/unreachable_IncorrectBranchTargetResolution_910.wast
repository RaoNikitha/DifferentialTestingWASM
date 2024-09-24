;; 1. **Test Description:** Place an `unreachable` instruction inside a block and use a `br` instruction to jump out of the block. Verify if the `unreachable` instruction causes a trap before the branch is resolved.     - **Constraint Checked:** Ensures proper handling of `unreachable` within blocks and correct branch target resolution.    - **Incorrect Branch Target Relation:** Ensures that the branch correctly skips the unreachable trap only if it jumps out of the block as intended.

(assert_invalid
  (module (func $unreachable-in-block-with-br
    (block (unreachable) (br 0))
  ))
  "unreachable reached"
)