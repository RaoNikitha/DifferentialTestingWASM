;; 3. **Complex Stack Operations Before `br_if`**:    - Introduce multiple stack operations before a `br_if` with a return on true condition. Check if intermediate stack manipulations result in incorrect condition evaluation leading to improper `return`.

(assert_invalid
  (module
    (func $complex_stack_operations (result i32)
      (i32.const 42)
      (i32.const 1)
      (i32.const 0)
      (i32.eq)
      (br_if 0 (return))
      (i32.const 123)
    )
  )
  "type mismatch"
)