;; 2. **Mismatched Operand Types for Forward Branch:**    Construct a `br_table` inside a forward `block` where the block expects an `i32`, but the `br_table` directs to a label requiring a `f32`. This tests the ability of the implementation to enforce type consistency between the stack and the target label's type.

(assert_invalid
  (module (func $mismatched-operand-types-forward-branch
    (block (result i32)
      (br_table 0 0 (f32.const 1.0)) (i32.const 1)
    )
  ))
  "type mismatch"
)