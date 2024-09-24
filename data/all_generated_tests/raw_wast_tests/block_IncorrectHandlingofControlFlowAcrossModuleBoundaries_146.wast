;; 7. **Test Description**: Establish a `block` within an exported function's body, calling an imported function that improperly manipulates the operand stack.    **Constraint**: Examine robustness in maintaining stack integrity when crossing module calls within blocks.

(assert_invalid
  (module
    (import "env" "unbalanced" (func $unbalanced (param i32) (result)))
    (func $test
      (block (result i32)
        (call $unbalanced (i32.const 1))
        (i32.const 2)
      )
    )
  )
  "stack mismatch"
)