;; 8. **Test 8**: Use invalid operand types for the immediate `br_table` vector, ensuring certain labels would reach `BrTableArityMismatch`. Validate if `wizard_engine` handles all types correctly and raises the error, checking `WebAssembly`'s counterpart behavior.

(assert_invalid
  (module 
    (func $invalid-operand-types
      (block (result f32) (br_table 0 1 (i32.const 1)))
      (f32.const 0.0)
    )
  )
  "type mismatch"
)