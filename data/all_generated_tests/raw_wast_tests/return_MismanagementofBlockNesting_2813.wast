;; 2. **Conditional Branch in Nested Blocks**: Develop a function with a sequence of nested conditional branches (`if` and `else` blocks). Use `return` inside the inner conditional block. The test ensures the proper block unwinding occurs without mismanaging intermediate conditional environments.

(assert_invalid
  (module
    (func $conditional-branch-nested-blocks (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (if (result i32)
            (i32.const 1)
            (then (return (i32.const 42)))
            (else (return (i32.const 1)))
          )
        )
        (else (return (i32.const 1)))
      )
    )
  )
  "type mismatch"
)