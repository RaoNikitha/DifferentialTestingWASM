;; 3. **Test: Unreachable Code in `else` Block**    - **Description**: Include an `unreachable` instruction in the `else` block, followed by valid instructions that should never be executed.    - **Constraint Checked**: Correct handling of the `unreachable` instruction and subsequent code validation.    - **CFG Relevance**: Tests the integrity of the CFG when dealing with branches to unreachable code.

(assert_invalid
  (module (func $unreachable-code-in-else (param i32) (result i32)
    (if (result i32) (local.get 0)
      (then (i32.const 42))
      (else (unreachable) (i32.const 0))
    )
  ))
  "type mismatch"
)