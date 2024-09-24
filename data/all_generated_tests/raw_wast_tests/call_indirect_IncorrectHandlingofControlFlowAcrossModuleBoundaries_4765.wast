;; 4. **Test for Incorrect Function Type Index Resolution**:    Use an indirect call instruction with a valid function index but with an incorrectly resolved function type index. Import the function and ensure that the function call conforms to the type index. This test checks whether the implementation correctly resolves and validates the function type index.

(assert_invalid
  (module
    (type $sig-1 (func (param i32)))
    (type $sig-2 (func (param f32)))
    (table 1 funcref)
    (func $f (param i32))
    (elem (i32.const 0) $f)
    (func $test-func
      (call_indirect (type $sig-2) (i32.const 0))
    )
  )
  "type mismatch"
)