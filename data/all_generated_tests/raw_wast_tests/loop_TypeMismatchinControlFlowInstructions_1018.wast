;; 9. **Mismatch in Block Type and Instruction Consumption**: Formulate a loop that declares a block type expecting a certain type of operand but uses instructions that consume a different type. This will test the correct handling of operand stack types according to block type expectations.

(assert_invalid
  (module (func $mismatch-block-type-consumption
    (i32.const 0) (f32.const 0) (loop (result i32) (drop))
  ))
  "type mismatch"
)