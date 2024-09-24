;; 5. Use an `if` block to conditionally invoke an imported function that traps (throws an error). Verify that the trap is correctly handled and does not leave the stack in an inconsistent state.

(assert_invalid
  (module
    (import "env" "trap" (func $trap))
    (func (export "test")
      (if (i32.const 0)
        (then (call $trap))
      )
    )
  )
  "type mismatch"
)