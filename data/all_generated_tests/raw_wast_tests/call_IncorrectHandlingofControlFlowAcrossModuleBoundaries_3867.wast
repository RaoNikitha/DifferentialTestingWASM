;; 6. **Call Exported Function with Boundary Traps**:    Test calling an exported function that conditionally traps. This verifies if the calling module properly handles the trap and restores stack state, ensuring consistency in how both implementations manage stack unwinding across traps.

(assert_invalid
  (module
    (func $condition_trap (param i32) (result i32)
      (if (local.get 0) (then (unreachable)) (else (i32.const 42)))
    )
    (export "trap_or_42" (func $condition_trap))
    (func (result i32)
      (call 0 (i32.const 1))
    )
  )
  "unreachable instruction reached"
)