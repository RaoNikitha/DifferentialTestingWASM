;; 3. **Test Case 3**:    - **Description**: Design a WASM module with a function table where the `call_indirect` instruction is issued in a branch of an if-else statement. Use the `br_if` instruction to switch between call paths, ensuring the correct path is targeted depending on the condition.    - **Constraint Checked**: Correct label resolution in conditional branching.    - **Incorrect Branch Target Resolution**: Validates that `br_if` correctly resolves branch targets within an if-else construct to ensure the appropriate function call through `call_indirect`.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $callee (param i32) (result i32)
      local.get 0
    )
    (func (param i32) (result i32)
      local.get 0
      (if (result i32)
        (then
          i32.const 0
          (call_indirect (type 0))
        )
        (else
          i32.const 0
        )
      )
    )
  )
  "type mismatch"
)