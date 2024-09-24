;; 7. **Test Description:**    - Call a function passing parameters but the function traps with `unreachable` before consuming parameters, and ensure the invocation traps correctly.    - This test verifies if the function call respectful of call semantics, traps correctly on `unreachable` without mishandling parameters.

(assert_invalid
  (module
    (func $trap_before_params (param i32 i32) 
      (unreachable)
    )
    (func (call $trap_before_params (i32.const 10) (i32.const 20)))
  )
  "unreachable causes trap before consuming parameters"
)