;; 9. **Test Description:**    Design an `if` instruction where the `else` block calls an imported function altering global states, then returns to the parent module to check the updated global state. Ensure that changes are correctly applied and the stack state is maintained across boundaries.

(assert_invalid
  (module
    (import "env" "alter_global" (func $alter_global))
    (global $g (mut i32) (i32.const 0))
    (func $test (result i32)
      (i32.const 1)
      (if (result i32)
        (i32.const 42)
        (else
          (call $alter_global)
          (global.get $g)
        )
      )
    )
  )
  "type mismatch in if")