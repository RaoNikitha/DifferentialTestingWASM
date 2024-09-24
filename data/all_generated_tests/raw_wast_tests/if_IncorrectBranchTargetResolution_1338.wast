;; 9. **Improperly Nested `br` and Function Calls**:    - Construct nested `if` blocks where inner blocks include calls to functions with `br` targets back to outer blocks.    - Check that the nested contexts are preserved across function calls.    - This scenario assesses if dynamic context changes due to function calls handle branch targets correctly.

(assert_invalid
  (module 
    (func $nested-block-invalid (result i32)
      (if (result i32) 
        (i32.const 1) 
        (then 
          (if (result i32)
            (i32.const 2)
            (then 
              (call $some_function) 
              (br 1)
            )
          ) 
          (i32.const 2)
        ) 
        (else 
          (call $toggle) 
          (i32.const 1)
        )
      )
    )
    (func $some_function (result i32) (unreachable))
    (func $toggle (result i32) (i32.const 0))
  )
  "improper nesting of br and function calls"
)