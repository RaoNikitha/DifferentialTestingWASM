;; 6. **Test Description:**    Introduce an `if` instruction where the `else` block calls an imported function that itself includes an `if` statement with nested branches. Ensure correct propagation of the control flow back to the parent module upon a false condition in the outer `if`.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func (export "test")
      (if (result i32) (i32.const 1)
        (then (nop))
        (else
          (call $externalFunc)
          (if (result i32) (i32.const 0)
            (then (i32.const 1))
            (else (i32.const 2))
          )
        )
      )
    )
  )
  "type mismatch"
)