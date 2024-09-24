;; 4. **Deep Recursion in Loop Calls**: Implement deep recursion using loop-callback structures profoundly. This is to test if the stack unwinding and frame management resulted in `Wizard Engine` handling operand stacks differently.

(assert_invalid
  (module
    (func $deep_recursion (result i32)
      (local i32)
      (i32.const 1000000)
      (loop (result i32)
        (br_if 0 (i32.eqz (tee_local 0 (i32.sub (get_local 0) (i32.const 1)))))
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)