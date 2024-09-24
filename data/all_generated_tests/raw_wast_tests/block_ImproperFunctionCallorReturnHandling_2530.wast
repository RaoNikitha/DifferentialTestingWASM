;; 1. **Test Mismatched Function Return Type:**    - Create a function that is specified to return an `i32` but contains a `block` that incorrectly nests a `call` to a function returning `f32` without proper handling, ensuring type validation catches it.    - **Constraint:** Ensures correct type checking within nested blocks handling function calls.

(assert_invalid
  (module (func $mismatched-function-return-type (result i32)
    (block (result i32)
      (call $func-returning-f32)
    )
  )
  (func $func-returning-f32 (result f32) (f32.const 3.14))
  )
  "type mismatch"
)