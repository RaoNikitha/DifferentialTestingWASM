;; 8. **Test 8 - Stack-Polymorphic Operand Misalignment**:    Develop a `br_table` instruction where the operand types are stack-polymorphic yet misaligned with the target block types, resulting in an invalid CFG. This ensures stack-polymorphic operations adhere to the type matching constraints.

(assert_invalid
  (module (func $stack_polymorphic_misalignment
    (block (result i32) (i32.const 1) (br_table 0 (block (block) (i32.const 1))))
  ))
  "type mismatch"
)