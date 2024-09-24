;; 9. Test a nested `if-else` structure involving arithmetic and comparison operations. `WebAssembly Validator` manages stack flows correctly while `Wizard Engine` loses operand state and branches wrongly.

(assert_invalid
  (module
    (func $nested-if-else
      (i32.const 2)
      (i32.const 3)
      (if (result i32)
        (i32.sub)
        (then
          (i32.const 4)
          (if (result i32)
            (i32.eqz)
            (then (i32.const 5))
            (else (i32.add))
          )
        )
        (else (i32.mul))
      )
      (drop)
    )
  )
  "type mismatch"
)