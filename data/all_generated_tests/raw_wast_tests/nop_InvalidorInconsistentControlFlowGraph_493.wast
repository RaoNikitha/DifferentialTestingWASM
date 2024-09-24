;; 4. **Test Description**: Use `nop` instruction within an `if` block and ensure both true and false paths are evaluated correctly.    **Constraint Checked**: `nop` within control flow retains correct path execution.    **Relation to CFG**: Secures the `if` statement branches converge and diverge as expected without being disturbed by `nop`.

(assert_invalid
  (module
    (func $if-nop-test
      (result i32)
      (if (result i32)
        (i32.const 1)
        (then (nop) (i32.const 2))
        (else (i32.const 3))
      )
    )
  )
  "type mismatch"
)