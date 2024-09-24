;; 3. **Test Name: Incorrect Operand Stack Type**    **Description:** Create a scenario where the type of value on top of the stack is not `i32` before the `br_if` instruction. `wizard_engine` should catch this mismatch with an explicit error, while WASM uses a generic approach.    **Infinite Loop Relation:** Misinterpretation of stack types can prevent correct branching, causing loops to run indefinitely.

(assert_invalid
  (module (func $type-mismatch-operand (block (br_if 0 (f32.const 1.0)))))
  "type mismatch"
)