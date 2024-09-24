;; 6. Formulate an `if` statement with a forward branch that incorrectly manages the stack height causing a CFG mismatch. Validates proper verification of stack consistency in control flow.

(assert_invalid
  (module
    (func $stack-mismatch
      (i32.const 1)
      (if (result i32)
        (then
          (i32.const 2)
          br 0
          i32.const 3
        )
        (else
          i32.const 4
        )
      )
    )
  )
  "type mismatch"
)