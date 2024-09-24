;; 5. **Test Misaligned Block and Function Output Expectation:**    - Embed a `call` to a function expecting multiple return types inside a `block` with invalid `blocktype` mismatching the expected results from the function.    - **Constraint:** Examines the consistency of result type handling from function calls within blocks.

(assert_invalid
  (module
    (func $nested-block-call-type-mismatch (result i32)
      (block (result i32)
        (call $multi-return-func)
      )
    )
    (func $multi-return-func (result i32 i32)
      (i32.const 1) (i32.const 2)
    )
  )
  "type mismatch"
)