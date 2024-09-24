;; 10. **Test 10**: Test places a function expecting `[i32, i32, i64]` in a control flow block but provides `[i64, i32, f32]` arguments at the call site. It evaluates the stringency of argument and signature mismatch detection within control flows.

(assert_invalid
  (module
    (func $test-func (param i32 i32 i64))
    (func $invalid-call
      (block 
        (call $test-func (i64.const 1) (i32.const 2) (f32.const 3.0)))))
  "type mismatch"
)