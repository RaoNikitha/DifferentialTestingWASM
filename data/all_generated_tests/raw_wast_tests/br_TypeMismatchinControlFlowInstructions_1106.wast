;; 7. **Test for Multiple Operand Mismatches**: Create a nested control structure where a `block` within another `block` expects multiple specific operand types (`i32` and `f32`). Branch incorrectly to this inner block with reversed operands (`f32` and `i32`) to determine if the type mismatch is flagged.

(assert_invalid
  (module
    (func $multiple-operand-mismatches
      (block (block (result i32 f32) 
        (br 1 (f32.const 1.0) (i32.const 42))
      ))
    )
  )
  "type mismatch"
)