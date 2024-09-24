;; Place `nop` instructions between a value set operation and a conditional branch to ensure the `br_if` only triggers if the value is correct.

(assert_invalid
  (module
    (func $test-nop-branch
      (i32.const 1)
      nop
      br_if 0
    )
  )
  "unexpected token"
)