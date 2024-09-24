;; 1. Import a function from another module and call it with parameters that are valid within the expected range. Verify that the function call completes successfully and returns the correct result without causing a stack overflow or underflow. Ensure this involves error handling for unknown function indices.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func (param i32) (call $external_func (i64.const 42)))
  )
  "type mismatch"
)