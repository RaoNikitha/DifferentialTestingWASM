;; 8. **Test Case 8: Use of Unreachable after Complex Operand Stack Manipulation**    - **Description:** Module A calls an imported function from Module B that performs multiple stack operations before hitting `unreachable`. This test ensures that complex operand stack manipulations followed by `unreachable` are handled consistently across modules.

(assert_invalid
  (module
    (import "moduleB" "func" (func $imported))
    (func $type-complex-operand-manipulation
      (block
        (i32.const 0)
        (i64.const 1)
        (f32.const 2.0)
        (f64.const 3.0)
        (drop)
        (call $imported)
        (unreachable)
      )
    )
  )
  "type mismatch"
)