;; 7. Test with an `if` condition where the operand stack has side effects. `WebAssembly Validator` maintains proper stack height, but `Wizard Engine` erroneously branches due to popped state.

(assert_invalid
  (module (func $test-side-effect-operand-stack
    (local i32) 
    (local.set 0 (i32.const 1))
    (if (i32.const 1) 
      (then 
        (local.set 0 (i32.const 0)) 
        (i32.const 1)
      )
      (else 
        (local.set 0 (i32.const 1)) 
        (i32.const 0)
      )
    )
    (local.get 0)
  ))
  "type mismatch"
)