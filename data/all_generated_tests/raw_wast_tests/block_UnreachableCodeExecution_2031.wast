;; 2. **Branch to Nonexistent Label**:    - Create a block with instructions containing a branch targeting a label that does not exist. Immediately after, place an `unreachable` instruction.    - The test ensures proper error handling for invalid branch targets.    - If an incorrect branch resolves and bypasses error handling, it’ll reach the `unreachable` instruction.

(assert_invalid
  (module (func $branch-to-nonexistent-label
    (block (br 1) (unreachable))
  ))
  "unknown label"
)