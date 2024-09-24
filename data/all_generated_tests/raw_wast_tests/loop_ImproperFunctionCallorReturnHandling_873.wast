;; 4. **Test Description**: A `loop` that calls a function which itself contains a loop and calls another function, creating deep nested function call chains.    - **Constraint**: Validates the handling of deeply nested function calls and ensuring stack integrity throughout.    - **Improper Handling**: Incorrect stack tracking for deeply nested calls causing mismanagement of call returns or invalid state. -

(assert_invalid
  (module
    (func $f1 (result i32) (i32.const 1) (loop (result i32) (call $f2) (br 0)))
    (func $f2 (result i32) (i32.const 2) (loop (result i32) (call $f3) (br 0)))
    (func $f3 (result i32) (i32.const 3) (loop (result i32) (br 0)))
    (start $f1)
  )
  "stack overflow"
)