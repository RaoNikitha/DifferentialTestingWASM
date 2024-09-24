;; 1. **Multiple Functions with Varying Return Types**:    Create a module with multiple functions, each returning different types and having different return values on their stack. Ensure calls between these functions vary in their parameters and return types, stressing the operand stack management.

(assert_invalid
  (module
    (func $func1 (param i32) (result i32)
      (local i32)
      (i32.const 10)
      (return)
    )
    (func $func2 (param f32) (result f32)
      (local f32)
      (f32.const 20.0)
      (call $func1 (i32.const 5))
      (return)
    )
  )
  "type mismatch"
)