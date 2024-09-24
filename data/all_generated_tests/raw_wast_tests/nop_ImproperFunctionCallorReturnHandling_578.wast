;; 9. **Test Description**: Construct a scenario where multiple functions call a common function containing `nop` instructions. Verify that each calling function correctly receives the expected return value.    - **Constraint Checked**: Ensures call-return chain integrity.    - **Relation to Improper Handling**: Mismanaged `nop` can affect return values along the call chain.

(assert_invalid
  (module
    (func $common_fn (nop) (nop) (nop) (return))
    (func $caller_1 (call $common_fn) (i32.const 1))
    (func $caller_2 (call $common_fn) (i32.const 2))
    (func (export "main") (call $caller_1) (call $caller_2))
  )
  "return type mismatch"
)