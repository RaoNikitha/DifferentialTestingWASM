;; Embed `nop` within an `if-else` branch where each branch has coercive type requirements. Ensure the stack does not align with post-`nop` expectations in one of the branches and observe if wizard_engine detects the discrepancy.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (if (result i32)
        (local.get 0)
        (nop)
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)