;; 9. **Invalid Type Handling in Nested Blocks**: In a series of nested blocks, push values of different types and ensure that type mismatches between expected and actual stack state within and across blocks are correctly handled, avoiding stack corruption.

(assert_invalid
  (module (func $invalid-nested-block-type (result i32)
    (block (result i32)
      (block (result f32) 
        (f32.const 0.0) 
        (block (result i64) 
          (i64.const 0))
        (i32.const 1))
      (i32.const 2))
  ))
  "type mismatch"
)