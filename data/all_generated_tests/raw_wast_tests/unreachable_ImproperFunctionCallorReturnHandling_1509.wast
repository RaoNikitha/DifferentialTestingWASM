;; 10. **Test Description:**     - A block with `unreachable` immediately after a `call` instruction. The return from the call should not affect subsequent execution.     - **Constraint:** Ensures post-call unreachable traps correctly before processing return values.     - **Improper Function Call or Return Handling:** Checks if appropriate steps are taken to halt post-call return processing.

(assert_invalid
  (module (func (block (result i32) (call $dummy) (unreachable))))
  "type mismatch"
)