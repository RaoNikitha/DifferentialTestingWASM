;; 10. **Multiple Return Types Misalignment**:    - **Test Description**: Have a function with multiple return types and verify the caller misinterprets the order or types of these returns.    - **Constraint Checked**: Proper handling of multiple return values.    - **CFG Relevance**: Confirms that CFG correctly aligns return types between caller and called function, avoiding misaligned return paths.

(assert_invalid
  (module
    (type (func (param i32) (result i32 f64)))
    (func (param i32) (result i32 f64)
      (i32.const 42)
      (f64.const 3.14)
    )
    (func
      (call 0
        (i32.const 0))
      ;; Push type misinterpretation 
      (i32.add)
    )
  )
  "type mismatch"
)