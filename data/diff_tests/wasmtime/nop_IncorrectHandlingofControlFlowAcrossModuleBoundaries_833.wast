;; 4. Validate a module where `loop` and `if` control structures are used around a `call` to an imported function, interspersed with `nop`. Ensure the function has complex control flow. This checks if `nop` keeps the control flow intact and properly returns to the loop or condition evaluation after a cross-module call.

(assert_invalid
  (module
    (import "env" "func" (func $imported))
    (func (local $tmp i32)
      (loop $loop
        (nop)
        (block
          (if (i32.eqz (local.get $tmp))
            (then
              (call $imported)
              (nop)
              (br $loop)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)