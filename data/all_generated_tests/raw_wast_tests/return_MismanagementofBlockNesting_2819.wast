;; 8. **Recursive Function in Nested Blocks**: Implement a function calling itself recursively with multiple nested blocks, inserting a `return` call in one of the recursive calls. The test verifies the proper unwinding of stacks and that `return` does not exit wrongly from an intermediary recursive invocation.

(assert_invalid
  (module
    (func $recursive (param i32) (result i32)
      (block (result i32)
        (if (i32.eqz (local.get 0))
          (then (return (i32.const 1)))
        )
        (block (result i32)
          (return (call $recursive (i32.sub (local.get 0) (i32.const 1))))
        )
      )
    )
  )
  "type mismatch"
)