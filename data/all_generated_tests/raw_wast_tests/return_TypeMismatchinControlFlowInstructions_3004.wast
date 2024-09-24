;; 3. **Test with Conditional Return Inside Block**:    - Define a function with conditional branches inside a block, returning different types (`i32` or `f32`) based on conditions.    - **Constraint:** The `return` rule should enforce type consistency for any branch paths.    - **Type Mismatch:** Checks for proper type handling within conditional branches leading to the `return`.

(assert_invalid
  (module
    (func $conditional-return-type-mismatch (result i32)
      (i32.const 1)
      (block (br_if 0 (return (f32.const 1.0))))
    )
  )
  "type mismatch"
)