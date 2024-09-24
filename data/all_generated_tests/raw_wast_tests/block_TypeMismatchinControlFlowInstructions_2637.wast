;; 8. **Test Description**: Develop a `block` expecting an `i32` but end with an `unreachable` instruction preceded by an invalid type-like `f64`, ensuring both the correctness of type validation and error handling within blocks.

(assert_invalid
  (module (func $test-invalid-block (result i32)
    (block (result i32)
      (f64.const 1.0) 
      (unreachable)
    )
  ))
  "type mismatch"
)