;; 5. **Branch with Multiple Operand Types:**    - Test a `block` with two result operands of types `i32` and `f64`. Make the `br` instruction erroneously branch with `f32` and `f64` types. This checks if both types are verified upon the branch.

(assert_invalid
  (module (func $multi-operand-type-mismatch
    (block (result i32 f64)
      (i32.const 1)
      (f32.const 1.0)
      (f64.const 1.0)
      (br 0)
    )
  ))
  "type mismatch"
)