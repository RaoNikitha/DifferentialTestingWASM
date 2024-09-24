;; 6. **Test Description**: Define a function type that expects more complex argument configurations (multi-value). Use a mismatched simpler function type index in `call_indirect` such that if mismatched function is invoked, it executes `unreachable`.    - **Constraint Checked**: Function type conformity and complexity in indirect calls.    - **Unreachable Code Execution**: Ensures traps are appropriately raised for type complexity mismatches before reaching `unreachable`.

(assert_invalid
  (module
    (type $sig-complex (func (param f64 i32 f32)))
    (type $sig-simple (func (param i32)))
    (table funcref (elem (func $testfunc (param i32)))))
    (func $testfunc (unreachable))
    (func $complex-call-test
      (call_indirect (type $sig-complex) (i32.const 0) (f64.const 1.0) (i32.const 2) (f32.const 3.0))
    )
  )
  "type mismatch"
)