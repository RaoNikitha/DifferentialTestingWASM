;; 9. **Type Mismatch on Branch**:    - **Description**: Construct a block with an expected result type but use `br_if` with mismatched operand types branching to this block.    - **Constraint**: Operand stack type consistency.    - **CFG Impact**: CFG represents invalid state transitions due to type mismatches in branch conditions.

(assert_invalid
  (module (func $type-mismatch-on-branch (result i32)
    (block (result i32) (br_if 0 (i32.const 1) (f32.const 0.0)) (i32.const 0))
  ))
  "type mismatch"
)