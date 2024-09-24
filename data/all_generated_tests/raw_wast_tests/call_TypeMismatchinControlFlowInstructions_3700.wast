;; 9. **Test 9**: Test incorporates a call from a block passing `[i32, i32]` arguments to a function expecting `[i64]`. This checks if the engine properly detects mismatched argument types in control-flow-related function calls.

(assert_invalid
  (module
    (type $sig (func (param i64)))
    (func $incorrect-arg-types
      (block
        (call 0 (i32.const 1) (i32.const 2))
      )
    )
    (func (type $sig))
  )
  "type mismatch"
)