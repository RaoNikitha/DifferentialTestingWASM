;; 5. Test an `if`-else construct where the else branch contains a `br` instruction that jumps to a label with mismatched operand types. This will check if the enforcement of type consistency is maintained across conditional branches.

(assert_invalid
  (module
    (func (result i32)
      (local i32)
      (if (i32.const 1)
        (then
          (nop)
        )
        (else
          (block (result i32)
            (br 1 (i32.const 42))
          )
        )
      )
    )
  )
  "type mismatch"
)