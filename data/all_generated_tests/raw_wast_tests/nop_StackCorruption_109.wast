;; 10. Write a function that executes a series of complex stack operations involving various data types (e.g., integers, floats), with periodic `nop` instructions inserted. Monitor the stack state throughout the execution to catch any inconsistencies.

(assert_invalid
  (module
    (func $complex_stack_operations 
      i32.const 10
      f32.const 5.0
      nop
      f64.const 20.0
      i64.const 15
      nop
      drop
      drop
      drop
      drop
    )
  )
  "type mismatch"
)