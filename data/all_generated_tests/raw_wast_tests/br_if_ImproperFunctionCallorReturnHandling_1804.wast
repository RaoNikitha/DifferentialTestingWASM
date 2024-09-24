;; 5. **Test: Conditional Function Call in Complex Control Structure**    - **Description:** Use nested control structures (`block`, `if`, `loop`) with `br_if` to conditionally call a function. Verify how the stack is affected by the function calls and the branching instructions.    - **Constraint Check:** Ensures that the combination of branching and function calls does not result in stack underflows or incorrect function returns.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block
          (loop
            (call $dummy_function)
            (br_if 0 (i32.const 0))
            (br_if 1 (i32.const 1))
          )
        )
        (i32.const 5)
      )
    )
    (func $dummy_function)
  )
  "type mismatch"
)