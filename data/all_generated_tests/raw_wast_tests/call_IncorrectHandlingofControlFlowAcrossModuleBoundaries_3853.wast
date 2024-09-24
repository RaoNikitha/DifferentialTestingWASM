;; 2. **Call Exported Function Across Modules with Mismatched Return Types**:    - **Reasoning**: This test ensures that the return types of exported functions are correctly handled when called from another module.    - **Description**: Create two modules, where Module A exports a function that returns an integer, and Module B calls this function but expects a float result. Examine whether both implementations correctly trap or mishandle the return type inconsistency.

(assert_invalid
  (module
    (import "moduleA" "exportedFunc" (func $importedFunc (result i32)))
    (func (result f32)
      (call $importedFunc)
    )
  )
  "type mismatch"
)