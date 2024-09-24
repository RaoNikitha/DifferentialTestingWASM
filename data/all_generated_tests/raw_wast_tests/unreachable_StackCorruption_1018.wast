;; 9. **Test: Function Returns With Unreachable**    - Use `return` statements in functions containing `unreachable` followed by type-producing instructions like `i32.const`.    - **Stack Corruption Check:** Validates that `return` correctly clears stack states after `unreachable`.

(assert_invalid
  (module (func $type-func-return-unreachable (result i32)
    (return (unreachable)) (i32.const 1)
  ))
  "type mismatch"
)