;; 8. **Test: Nested Function Calls with Complex Stack Handling**    - **Description**: Implement nested function calls, where an inner function includes a `br` that branches back to an outer function’s label. Validate if stack unwinding respects the outer function’s context and operand requirements.    - **Constraint Checked**: Verifies correct label resolution and context preservation across nested function calls.    - **Improper Handling Aspect**: Mismanagement of stack between nested function calls leading to incorrect type restoration.

(assert_invalid
  (module
    (func $nested_fn_calls_complex_stack (param $x i32) (result i32)
      (block $outer
        (call $inner)
        (i32.const 42)
      )
    )
    (func $inner (param $y i32) (result i32)
      (block $inner_block
        (br $outer)
      )
      (i32.const 0)
    )
  )
  "unknown label"
)