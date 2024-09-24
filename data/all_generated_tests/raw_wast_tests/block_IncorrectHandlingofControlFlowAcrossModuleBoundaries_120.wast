;; 1. Import a function that returns an integer and call it within a `block` inside the main module. Ensure that the return value matches the block type and check for operand stack consistency after the `block`. This test will verify if the stack is managed correctly when returning from the imported function.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test_function
      (block (result i32)
        (call $external_func)
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)