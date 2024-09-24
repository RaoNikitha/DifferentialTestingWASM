;; 8. **Unreachable in Block Followed by Br_if:**    - Create a block followed by a `br_if` instruction. Place `unreachable` inside the block and test if the `br_if` is correctly ignored and the function traps immediately without incorrectly impacting the control flow.

(assert_invalid
  (module (func $unreachable-in-block-followed-by-br_if
    (block
      (unreachable)
      (br_if 0 (i32.const 1))
    )
  ))
  "type mismatch"
)