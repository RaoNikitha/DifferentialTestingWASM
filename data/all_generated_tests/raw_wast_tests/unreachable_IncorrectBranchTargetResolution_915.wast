;; 6. **Test Description:** Implement a function with `unreachable` at the end of a block, and use `br` in different parts of the function to (not) reach the block's end.    - **Constraint Checked:** Ensures that br jumps correctly avoid the `unreachable` instruction at the block's end.    - **Incorrect Branch Target Relation:** Checks if branch targets are resolved correctly and do not erroneously fall through to `unreachable`.

(assert_invalid
  (module 
    (func $block-end-unreachable-br 
      (block (br 0) (unreachable))
    )
  )
  "type mismatch"
)