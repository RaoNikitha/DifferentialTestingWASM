;; 4. Create a scenario where an `if` condition evaluates to zero triggering the `else` block which inclines to a loop. The `br_if` in the loop is dependent on a variable manipulated in `if` but incorrectly hoisted. This can detect validation inconsistencies with state variable handling.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (if (i32.eqz (local.get 0))
        (then (local.set 0 (i32.const 1)))
        (else (loop (br_if 1 (local.get 0))))
      )
    )
  )
  "type mismatch"
)