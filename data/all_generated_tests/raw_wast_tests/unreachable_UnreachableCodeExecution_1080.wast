;; 1. **Test to check unconditional trap within a `block` construct:**    - Create a test where the `unreachable` instruction is placed inside a `block` with no branch leading to it. This checks whether entering the block erroneously leads to a trap.    - **Constraint:** Verifies if the position tracking gracefully handles enclosed structures like blocks.    - **Related to**: Ensures any interpreter correctly handles and exits with a trap.

(assert_invalid
  (module (func $unreachable-in-block
    (block
      (unreachable)
    )
  ))
  "type mismatch"
)