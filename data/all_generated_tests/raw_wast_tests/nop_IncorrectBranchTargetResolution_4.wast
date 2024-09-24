;; 5. **Test Description: `if` Statement with `br` to Else Block and `nop`**    - **Scenario**: Apply `br` to jump to an `else` block within an `if` statement, with `nop` within the `then` block.    - **Constraint**: Ensures `nop` does not alter the target label within the `if-else` control structure.    - **Context**: Incorrect resolution might cause the else block to be skipped or the entire structure to malfunction.

(assert_invalid
  (module 
    (func $if-br-else-nop
      (if (i32.const 1)
        (then (nop))
        (else (br 0))
      )
    )
  )
  "invalid use of br"
)