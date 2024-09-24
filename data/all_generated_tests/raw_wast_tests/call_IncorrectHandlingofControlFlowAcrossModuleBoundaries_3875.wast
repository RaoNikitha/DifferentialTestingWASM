;; 4. **Export and Import Function with Multiple Returns**:    - **Constraint Checked**: Checks handling of functions with multiple return values across modules.    - **Description**: Create a module that exports a function with multiple return values. Another module imports this function and calls it. Validates if both modules handle the return values correctly without corrupting the stack state.

(assert_invalid
  (module
    (func $exportedFunc (export "multi_return") (result i32 i32)
      (i32.const 42) (i32.const 84)
    )
  )
)

(assert_invalid
  (module
    (import "env" "multi_return" (func $imported (result i32 i32)))
    (func (result i32)
      (call $imported)
      (drop) (drop)
      (i32.const 0)
    )
  )
  "type mismatch"
)