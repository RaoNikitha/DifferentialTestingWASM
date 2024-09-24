;; 6. **Test Description:** Use an `unreachable` instruction in a `block` that is followed by a `return` statement.    **Constraint:** The `unreachable` should trap before the function can return.    **Relation to Unreachable Code Execution:** Ensures that `unreachable` within control flow constructs interrupts execution correctly.

(assert_invalid
  (module (func $block-unreachable-return (result i32)
    (block (unreachable) (return (i32.const 42)))
  ))
  "type mismatch"
)