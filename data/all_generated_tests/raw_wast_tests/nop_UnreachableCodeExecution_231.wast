;; 2. Position a `nop` inside an `if` statement where the condition is false, followed by an `unreachable` in the else block. Ensure that the logic correctly skips the `unreachable`.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (if (local.get 0)
        (then (nop) (i32.const 1))
        (else (unreachable))
      )
    )
  )
  "type mismatch"
)