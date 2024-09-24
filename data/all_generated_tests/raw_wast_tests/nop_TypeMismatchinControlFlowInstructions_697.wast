;; 8. **Mixed Type Blocks with Nop**:    - A block that expects and operates with multiple types on the stack, insert a `nop` midway, and then perform an invalid type operation.    - Ensures `nop` does not obscure type mismatches in complex stack operations.    - **Reasoning**: Tests type enforcement on mixed-type stack operations.

(assert_invalid
  (module
    (func $mixed-types
      (block (result i32)
        i32.const 1
        i32.const 2
        nop
        f64.const 3.0
        i32.add
      )
    )
  )
  "type mismatch"
)