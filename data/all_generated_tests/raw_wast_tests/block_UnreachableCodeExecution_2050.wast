;; 1. **Test 1: Nested Block with the Unreachable Instruction**    - **Description**: Create a nested block structure where the inner block contains an `unreachable` instruction. The test should check whether both implementations properly handle the `unreachable` instruction and return an appropriate error.    - **Constraint**: Ensures proper handling and detection of unreachable code inside nested blocks.

(assert_invalid
  (module (func $nested_block_unreachable
    (block (block (unreachable)))
  ))
  "unreachable code"
)