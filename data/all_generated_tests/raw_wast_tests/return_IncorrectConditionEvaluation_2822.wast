;; 1. **Incorrect Stack Handling with `br_if`**:    - Create a test where `br_if` executes conditionally based on a stack value. The condition should result in an immediate `return` if true. Verify if incorrect stack unwinding causes `return` to be executed unconditionally.

(assert_invalid
  (module
    (func $test_incorrect_stack_handling (param i32) (result i32)
      (local.get 0)
      (i32.const 1)
      (br_if 0 (return))
      (i32.const 0)
    )
  )
  "type mismatch"
)