;; 2. Construct a sequence where `nop` is placed between several conditional branches (`if`, `else`). Observe whether the branches are correctly respected and note any skipped conditional paths indicating improper CFG handling.

(assert_invalid
  (module
    (func $conditional-nop
      (if (i32.const 1)
        (then
          nop
          (br 0)
        )
        (else
          nop
          (br 1)
        )
      )
    )
  )
  "invalid branch depth"
)