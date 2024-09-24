;; 4. Use a block instruction with a function type expecting to return two `i32` values, but provide instructions that only produce one `i32` value and one `f32` value. This tests for correct type adherence with multiple return values in both environments.

(assert_invalid
  (module 
    (func $type-multiple-returns-mismatch (result i32 i32)
      (block (result i32 i32) 
        (i32.const 1) 
        (f32.const 1.0)
      )
    )
  )
  "type mismatch"
)