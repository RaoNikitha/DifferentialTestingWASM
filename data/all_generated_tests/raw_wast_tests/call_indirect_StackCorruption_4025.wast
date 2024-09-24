;; 4. **Nested Indirect Calls with Type Mismatch Test**:    - **Description**: Perform nested `call_indirect` instructions where the inner call has a type mismatch.    - **Constraint Check**: The inner call should trap correctly.    - **Stack Corruption Check**: Ensure the outer stack context is preserved without corruption.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32) (result i64)))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func $inner (type 0) (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $outer (param i32) (result i64)
      (call_indirect (type 0) (i32.const 1) (call_indirect (type 1) (i32.const 0) (local.get 0)))
    )
  )
  "type mismatch"
)