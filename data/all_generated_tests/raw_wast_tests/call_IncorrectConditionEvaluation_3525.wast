;; 4. **Test Description:** Call a function within a loop where the looping condition depends on the function's return value. Verify if the `wizard_engine` halts due to a failed stack condition check, while `WebAssembly` continues based on incorrect condition evaluation. Specific Constraint:** Loop condition evaluation tied to function results.

(assert_invalid
  (module
    (func $test-loop
      (loop (br_if 0 (i32.eqz (call 1))))
    )
    (func (result i32) (i32.const 0))
  )
  "unknown function"
)