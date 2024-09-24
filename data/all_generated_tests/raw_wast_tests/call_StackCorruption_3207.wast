;; 6. **Test Description**: Define a function with multiple return values and call it several times interleaved with other function calls, verifying that all return values are correctly managed and pushed onto the stack.    **Constraint Checked**: Multi-valued return management.    **Relation to Stack Corruption**: Mismanaging multiple return values can lead to stack inconsistencies.

(assert_invalid
  (module
    (func $multi_return (result i32 i32) (i32.const 1) (i32.const 2))
    (func $multi_caller
      (call $multi_return)
      (call $multi_return)
      (drop) (drop)
      (call $multi_return)
      (call $multi_return)
      (drop) (drop)
      (call $multi_return)
    )
    (func $single_call (call $multi_return) (drop) (drop))
    (func $interleaved
      (call $single_call)
      (call $multi_return)
      (call $single_call)
    )
  )
  "type mismatch"
)