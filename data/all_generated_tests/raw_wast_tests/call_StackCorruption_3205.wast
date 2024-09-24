;; 4. **Test Description**: Sequentially call multiple functions with varying parameter types and return values, ensuring that the transitions on the stack between calls are correctly managed.    **Constraint Checked**: Type consistency and sequential stack transitions.    **Relation to Stack Corruption**: Incorrect type handling or stack transitions can corrupt subsequent function calls' expectations.

(assert_invalid
  (module
    (func (param i32) (result i32) (local.get 0))
    (func (param f64) (result f64) (local.get 0))
    (func
      (call 0 (i32.const 42))
      (call 1 (f64.const 42.0))
      (call 0 (f64.const 42.0))
    )
  )
  "type mismatch"
)