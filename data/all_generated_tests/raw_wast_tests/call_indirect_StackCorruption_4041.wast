;; 10. **Function Type with Multiple Result Types**:     - Use `call_indirect` referencing a function with multiple result types to test the proper handling of function return values.     - Constraint Check: Validate if multiple return values are correctly managed and placed on the operand stack.     - Stack Corruption Relation: Failure to push all result values correctly can lead to an incorrect stack state for subsequent instructions.

(assert_invalid
  (module
    (type (func (param i32) (result i32 f64)))
    (table 1 funcref)
    (func $multiple-result-types
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)