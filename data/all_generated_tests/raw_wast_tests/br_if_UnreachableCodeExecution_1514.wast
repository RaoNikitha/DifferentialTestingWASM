;; 5. **Test 5 - Incorrect Operand Type for `br_if`**:    Create a function that pushes an incorrect type (not an `i32`) before `br_if`. This should trigger an error due to type mismatch. The wizard_engine should respond with a specific error, while WASM may generically report an invalid instruction.

(assert_invalid
  (module (func $type-incorrect-operand
    (block (br_if 0 (f64.const 1.0)))
  ))
  "type mismatch"
)