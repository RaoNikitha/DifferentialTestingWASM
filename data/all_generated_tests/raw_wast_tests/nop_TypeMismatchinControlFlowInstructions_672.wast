;; 3. **`nop` inside an `if`-`else` missing one branch result type**:    Include `nop` within an `if` block where one branch (either the `if` or the `else`) does not produce the expected type while the other does.    This checks if the `nop` impacts the control flow validation for type consistency across branches.

(assert_invalid
  (module
    (func (local i32)
      (if (result i32)
        (local.get 0)
        (nop)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)