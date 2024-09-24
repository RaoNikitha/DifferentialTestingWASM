;; 4. **`nop` within If-Else Structure**: Construct an `if-else` control flow with `nop` instructions inside both branches followed by branching instructions (`br` or `br_table`). Assess if incorrect `nop` handling affects branch target resolution.

(assert_invalid
  (module
    (func $nop-if-else
      (if (i32.const 1)
        (then (nop) (br 0))
        (else (nop) (br 0))
      )
    )
  )
  "type mismatch"
)