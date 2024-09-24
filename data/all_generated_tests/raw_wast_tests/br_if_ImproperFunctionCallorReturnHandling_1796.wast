;; 7. **Test Description**:    - **Test Name**: Function Return with Complex Operand Stack    - **Description**: Use a function returning complex data structures, followed by a `br_if` using part of the return data to branch conditionally.    - **Constraint Check**: Ensures correct stack management and operand extraction for conditional branching.    - **Improper Handling**: Validates handling of complex data structures in stack and branching logic.

(assert_invalid
  (module 
    (func $complex-operand-stack (result i32)
      (block (result i32)
        (call $return-complex)
        (i32.const 0) 
        (br_if 0 (i32.const 1))
      )
    )
    (func $return-complex (result i32 f64 f32) 
      (i32.const 5) 
      (f64.const 3.14) 
      (f32.const 2.71)
    )
  )
  "type mismatch"
)