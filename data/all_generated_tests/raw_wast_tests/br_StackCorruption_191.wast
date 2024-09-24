;; 2. **Testing Insufficient Operands:**    Create a branch instruction targeting a label requiring multiple operands. Prior to the branch, ensure the operand stack has one less operand than required. This test will reveal if either implementation safeguards against stack underflow.

(assert_invalid
  (module (func $insufficient-operands
    (block (result i32 i32) (i32.const 1) (br 0))
  ))
  "type mismatch"
)