;; 4. Test a function where `nop` is placed just before a conditional branch `br_if`, and validate if the branch is correctly not taken when the condition is false. Check for deviations in the branching behavior.

(assert_invalid
  (module
    (func (param i32) (local i32)
      (block $label
        (nop)
        (local.get 0)
        (br_if $label (local.get 1))
      )
    )
  )
  "type mismatch"
)