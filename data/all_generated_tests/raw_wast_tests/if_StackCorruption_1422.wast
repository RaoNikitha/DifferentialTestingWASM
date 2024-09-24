;; 3. **Test Name: Manipulating Empty Stack**    - **Description**: Construct an `if` instruction that is evaluated without sufficient stack entries to trigger operations within its blocks, thus verifying whether appropriate stack underflow handling or error is triggered.      ```wasm      (i32.const 0) (if (result i32) (drop) else (drop) end)      ```    - **Reasoning**: Verifies the behavior of stack manipulation when the `if` instruction is executed with an insufficient initial stack.

(assert_invalid
  (module
    (func $manipulate-empty-stack
      (i32.const 0) (if (result i32) (drop) else (drop) end)
    )
  )
  "type mismatch"
)