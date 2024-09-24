;; 8. Test an `if` instruction with a falsy zero condition evaluated from a comparison operation. `WebAssembly Validator` enters `else` as expected, but `Wizard Engine` enters `then` block due to mishandled condition evaluation.

(assert_invalid
  (module
    (func $misinterpreted-comparison (result i32)
      (i32.const 5)
      (i32.const 10)
      (i32.ge_u) ;; expected to push 0 (false) because 5 >= 10 is false
      (if (result i32) (then (i32.const 1)) (else (i32.const 0)))
    )
  )
  "condition not handled correctly"
)