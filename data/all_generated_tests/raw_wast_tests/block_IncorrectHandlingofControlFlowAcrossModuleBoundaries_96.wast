;; 7. **Calling function with block**:    - Create a function that contains a block calling other imported functions, then another block within that function calls the first function.    - Ensure stack operations and control flow are correctly managed without corrupting data when returning to the calling function.

(assert_invalid
  (module
    (import "env" "ext_func" (func $ext_func (result i32)))
    (func $nested_block_test
      (block (result i32)
        (call $ext_func)
        (block (result i32)
          (call $nested_block_test)
          (i32.add (i32.const 1) (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)