;; 10. **Test Nested Block Misaligned Return from Function Call:**     - Develop a nested block structure where an inner block calls a function returning an incorrect type for the outer block's `blocktype` constraints.     - **Constraint:** Validity checking for nested block structures influencing function call return types and error handling.

(assert_invalid
  (module 
    (func $nested-block-misaligned-return (result i32)
      (block (result i32)
        (block (result i64)
          (call $someFunction)  ;; Assume function returns i64 but outer block expects i32
          (br 1)
        )
      )
    )
    (func $someFunction (result i64)
      (i64.const 42)
    )
  )
  "type mismatch"
)