;; A `loop` containing a nested `if` structure, where the `if` checks a variable. Based on the check, a `br_if` to the loop start is triggered. Confirm the loop only exits under the right condition, avoiding indefinite looping due to incorrect branching.

(assert_invalid
  (module
    (func $test-loop-br_if
      (local i32)
      (local.set 0 (i32.const 0))
      (loop (result i32)
        (local.get 0)
        (i32.eqz)
        (if (result i32)
          (then
            (i32.const 1)
            (br_if 1)
          )
          (else
            (local.get 0)
            (i32.const 1)
            (i32.add)
            (local.set 0)
            (i32.const 0)
          )
        )
      )
    )
  )
  "type mismatch"
)