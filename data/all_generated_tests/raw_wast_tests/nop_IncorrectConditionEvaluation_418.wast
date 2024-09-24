;; 9. Insert `nop` prior to condition evaluations modified by previous instructions (e.g., calculations). Verify if `br_if` outcomes retain correctness, unaffected by preceding `nop`.

(assert_invalid
  (module
    (func $check_correctness
      (i32.const 0)
      (nop)
      (i32.eqz)
      (br_if 0)
    )
  )
  "invalid block type"
)