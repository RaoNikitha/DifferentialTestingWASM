;; 10. **Test Description**:    A sequence of nested `block`, `if`, and `loop` instructions, each containing `nop` instructions, will validate that the control stack and operand stack remain accurate and the execution flow is not improperly shortened or extended by `nop`.

(assert_invalid
  (module
    (func $nested-block-if-loop
      (block
        (loop
          (if (i32.const 1)
            (then
              nop
            )
          )
          nop
        )
        nop
      )
    )
  )
  "type mismatch"
)