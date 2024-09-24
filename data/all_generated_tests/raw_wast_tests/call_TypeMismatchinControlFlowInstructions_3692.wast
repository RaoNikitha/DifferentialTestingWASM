;; 1. **Test 1**: Test calls a function with a signature `[i32, i64] -> [i32]` but supplies arguments of type `[f32, i32]` at the call site. This checks if the implementation correctly verifies the input types against the function signature for type mismatch errors.

(assert_invalid
  (module
    (type $sig (func (param i32 i64) (result i32)))
    (func $call-test (call 0 (f32.const 1.0) (i32.const 2)))
    (func (type $sig))
  )
  "type mismatch"
)