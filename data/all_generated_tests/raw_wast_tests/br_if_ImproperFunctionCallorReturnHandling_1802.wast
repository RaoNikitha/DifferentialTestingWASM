;; 3. **Test: Forward Branch in Conditional Function Return**    - **Description:** Create a `br_if` that conditionally triggers a forward branch to skip a function call based on a stack operand. Check the correctness of stack state before and after the function is intended to return.    - **Constraint Check:** Ensures that the forward branch does not disrupt the return value or cause improper stack handling.

(assert_invalid
  (module
    (func $forward-branch-return (result i32)
      (block (result i32) 
        (br_if 0 (i32.const 1))
        (call $dummy)
      )
      (i32.const 0)
    )
    (func $dummy)
  )
  "unexpected end"
)