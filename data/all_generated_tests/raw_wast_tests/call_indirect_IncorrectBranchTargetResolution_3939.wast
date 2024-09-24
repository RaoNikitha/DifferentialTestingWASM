;; 8. **Branch to Inner Function from call_indirect**:    - Execute `call_indirect` in a nested function call scenario where the inner function's branch target could be resolved incorrectly.    - Checks for: Proper branch target resolution in nested function calls and correct operand stack handling.

(assert_invalid
  (module
    (type $inner_func_t (func (param i32) (result i32)))
    (type $outer_func_t (func (param i32) (result i32)))
    (func $inner_func (type $inner_func_t) (param i32) (result i32)
      local.get 0)
    (table 1 funcref)
    (elem (i32.const 0) $inner_func)
    (func $outer_func (type $outer_func_t) (param i32) (result i32)
      call_indirect (type $outer_func_t) (i32.const 0))
  )
  "type mismatch"
)