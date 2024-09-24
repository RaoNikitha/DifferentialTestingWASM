;; 4. Test Description: Nest `nop` inside an `if` condition that always evaluates to false, followed by an `unreachable` in the else branch. Ensure the control flow correctly skips the `nop` and triggers the `unreachable`.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32)
        (i32.const 0)
        (then (nop) (i32.const 1))
        (else (unreachable))
      )
    )
  )
  "type mismatch"
)