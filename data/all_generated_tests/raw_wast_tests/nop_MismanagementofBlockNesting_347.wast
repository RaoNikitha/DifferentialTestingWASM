;; 8. **Test Combined Control Structures with Nop**: Construct a WebAssembly function combining `block`, `loop`, and `if` instructions, scattered with `nop` instructions at various points. This checks if the control structures work correctly in combination without the `nop` introducing bugs.

(assert_invalid
  (module
    (func (block
            (loop
              (if (i32.const 1)
                (then
                  nop
                  )
                nop
                )
              nop
              )
            nop
            )
          )
    )
  "type mismatch"
)