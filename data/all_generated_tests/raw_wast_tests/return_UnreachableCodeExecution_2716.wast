;; 5. **Test Scenario**: Design a function with multiple nested blocks, where the `return` is invoked in the innermost block, and an unreachable instruction is added in the outermost block.    **Constraint**: Validates the stack unwinding reaches the correct outer block.    **Unreachable Code**: Detect if control flow erroneously hits outer unreachable.

(assert_invalid
  (module
    (func $nested-blocks-return-unreachable (result i32)
      (block
        (block
          (block
            (return (i32.const 42))
          )
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)