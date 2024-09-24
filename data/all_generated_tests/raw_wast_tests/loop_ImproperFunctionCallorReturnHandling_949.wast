;; 10. **Test Description 10**:     Develop a sequence where a `loop` contains both direct (`call`) and indirect (`call_indirect`) function calls. Ensure that the stack is correctly unwound and operands are properly handled for both types of function calls upon looping and return scenarios.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $func (param i32) (result i32)
      local.get 0
    )
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func (result i32)
      i32.const 0
      loop (result i32)
        i32.const 10
        call $func
        i32.const 0
        call_indirect (type $sig)
      end
    )
  )
  "type mismatch"
)