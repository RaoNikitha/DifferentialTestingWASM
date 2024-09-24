;; 4. **Test for Type Mismatch in Condition Operand**: Construct a WebAssembly module where the conditional operand for the `if` instruction is of type `f32` instead of the required `i32`. This test evaluates the validation of the condition type itself before entering the `if` block.

(assert_invalid
  (module (func $type-mismatch-operand
    (f32.const 0.0)
    (if (then (nop)))
  ))
  "type mismatch"
)