;; 6. **Test Name: Excessive Operand Consumption**    - **Description**: Create a test where the `if` block consumes more operands than provided, directed to an `else` block compensating with additional operands to test robust error handling when operand deficits occur.      ```wasm      (i32.const 1) (if (result i32) (i32.add) else (i32.add (i32.const 2) (i32.add)) end)      ```    - **Reasoning**: Validates the implementations’ response to operand stack mismatches post-condition execution from `if` to `else`.

(assert_invalid
  (module (func $excessive-operand-consumption
    (i32.const 1)
    (if (result i32) (i32.add) else (i32.add (i32.const 2) (i32.add)) end)
  ))
  "type mismatch"
)