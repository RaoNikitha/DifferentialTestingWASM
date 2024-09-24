;; Test 3: Embed `nop` within nested `if-else` structures, ensuring the `if` branch returns a different stack type (`i64`) than the `else` branch (`i32`). Observe if the two implementations handle the resultant type mismatch correctly.

(assert_invalid
  (module
    (func $nested-nop-if (result i32)
      (if (result i32)
        (i32.const 1)
        (nop)
        (else
          (i64.const 0)
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)