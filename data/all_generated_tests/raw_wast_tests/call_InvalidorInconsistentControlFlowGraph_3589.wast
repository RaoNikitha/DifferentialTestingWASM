;; 8. **Global Index Out-of-Bounds**:    - **Test Description**: Attempt to use a global variable in the call that does not exist.    - **Constraint Checked**: Global sequence validity in function context.    - **CFG Relevance**: Validates that CFG correctly handles global variable scopes and indices.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0)) 
    (func $type-global-out-of-bounds (call $non_existent_function (global.get 1)))
  )
  "unknown global 1"
)