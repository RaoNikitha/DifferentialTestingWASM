;; 4. Complex nested `if`-statements within blocks containing `nop` instructions to verify that the presence of `nop` does not alter the expected conditional branch execution. The test should validate that all branches execute as intended without control mismanagement.

(assert_invalid
  (module
    (func $complex-if
      (block
        (if (i32.const 1)
          (then 
            (nop)
            (i32.const 0) ; This if-branch leaves a value on the stack
          )
          (else
            (nop)
          )
        )
        (i32.const 0) ; Expecting the result of the if-branch to be consumed or matched in type
        (nop) ; Additional nop for complexity
      )
    )
  )
  "type mismatch"
)