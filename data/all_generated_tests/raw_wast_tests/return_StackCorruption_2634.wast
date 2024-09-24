;; 3. **Test Nested Block Return**:    - Construct a function with nested blocks of different operand stack heights and include a `return` from within a deeply nested block. Compare how both implementations handle the stack unwinding and ensure the outermost block's stack state is correctly restored.

(assert_invalid
  (module
    (func $nested-block-return (result i32)
      (block (block (return (i32.const 10)) (unreachable)) (i32.const 20))
    )
  )
  "type mismatch"
)