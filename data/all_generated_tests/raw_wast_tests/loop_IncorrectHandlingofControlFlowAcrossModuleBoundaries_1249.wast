;; 10. **Test: Loop with Call to Imported Function Returning Complex Types**    Description: Design a loop that calls an imported function returning a complex data type (e.g., tuples or structs). Ensure that the loop can handle these complex types correctly within its operand stack.    Constraints:    - Validate handling and manipulation of complex types across module boundaries.    - Ensure consistency in function call signature and return types.    - Verify that loop execution correctly processes complex return types.

(assert_invalid
  (module
    (import "env" "complex_func" (func $complex_func (result i32 i32)))
    (func $test_loop_complex
      (result i32 i32)
      (loop (result i32 i32)
        (call $complex_func)
        (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)