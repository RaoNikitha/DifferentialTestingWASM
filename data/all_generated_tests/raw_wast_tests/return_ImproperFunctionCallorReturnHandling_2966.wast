;; 5. Return from a recursive function call where intermediate results are pushed onto the stack. Verify if WebAssembly correctly unwinds the stack back to the function's entry state, whereas Wizard Engine might retain stack inconsistencies.

(assert_invalid
  (module
    (func $recursive_return (param i32) (result i32)
      (local.get 0)
      (if (result i32)
        (i32.eqz (local.get 0))
        (then
          (return (i32.const 0))
        )
        (else
          (local.set 0 (i32.sub (local.get 0) (i32.const 1)))
          (call $recursive_return (local.get 0))
          (i32.const 1)
          (return)
        )
      )
    )
  )
  "type mismatch"
)