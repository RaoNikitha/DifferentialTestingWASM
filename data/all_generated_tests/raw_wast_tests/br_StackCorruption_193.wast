;; 4. **Mixed Type Operands:**    Construct a control flow with mixed operand types on the stack followed by a branch instruction. This test will check if the stack unwinding and type restoration correctly manages mixed types without causing stack corruption.

(assert_invalid
  (module (func $mixed_type_operands (block (block (i32.const 1) (f64.const 2.3) (br 1)))))
  "type mismatch"
)