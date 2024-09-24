;; 6. **Test Description:** Placing `unreachable` in a series of nested blocks followed by a `br` instruction that skips blocks. The differential check is to verify if the blocks are correctly skipped and the `unreachable` effect is bypassed or whether it incorrectly influences control flow.        **Constraint Checked:** Correct handling of skip and branch instructions in the presence of `unreachable`.

(assert_invalid
  (module (func $type-unreachable-in-nested-blocks
    (block (block (block (unreachable) (br 2)) (unreachable)))
  ))
  "type mismatch"
)