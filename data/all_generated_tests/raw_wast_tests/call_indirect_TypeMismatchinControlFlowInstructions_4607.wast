;; 6. **Test Description**:    - Assess a scenario where `call_indirect` is nested inside a conditional block (`if` statement) with mismatched operand types (integer expected, but the available function has a float parameter), leading to conditional trap due to type mismatch.    - **Constraint Being Checked**:      - Conditional flow correctly handling parameter type expectations and mismatches.    - **Relation to Control Flow Instructions**:      - Ensures that conditionals enforce type constraints based on function signatures dynamically.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) 1)
    (elem (i32.const 1) 0)
    (func $func1 (type 0) (param i32) (result i32))
    (func $func2 (type 1) (param f32) (result i32))
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (call_indirect (type 0) (i32.const 1))
        (call_indirect (type 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)