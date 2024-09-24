;; Create a function using an `if-else` structure where `nop` precedes `br_if` in both branches. Ensure the correct branch is executed based on the condition.

(assert_invalid
  (module
    (func
      (if (result i32)
        (i32.const 1)
        (then
          (nop)
          (br_if 0 (i32.const 1))
        )
        (else
          (nop)
          (br_if 0 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)