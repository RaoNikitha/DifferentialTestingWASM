;; 5. **Test Description**: Add multiple `nop` instructions within a block that calls several imported functions, ensuring stack consistency and correct function execution order.    - **Constraint**: Validate nested function calls and stack state remain unaffected by `nop`.    - **Relates to**: Ensures nested function calls with `nop` are handled correctly.

(assert_malformed
  (module
    (func $nested (import "env" "nested_func"))
    (func $test
      nop
      call $nested
      nop
      call $nested
      nop
      call $nested
    )
  )
  "invalid token"
)