;; 8. **Test for Mixed Data Type Handling in 'br_table' Targets**:    - Examine if 'br_table' correctly interprets and manages branches leading to functions handling mixed data types.    - Design a 'br_table' where some branches lead to functions operating on different data types (int, float).    - This checks for any type-handling issues across branches and function calls.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $function1 (param i32) (call $function2))
    (func $function2 (param f64) (result f64) (f64.const 0.0))
    (func (param i32) (param f64) (block (br_table 0 1 (i32.const 0))))
  )
  "type mismatch"
)