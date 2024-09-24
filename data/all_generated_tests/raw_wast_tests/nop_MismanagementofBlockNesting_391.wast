;; 2. **`nop` within Nested `if-else` Constructs**:    Place `nop` instructions inside multiple nested `if-else` structures to ensure that the correct branch is taken regardless of the presence of `nop` instructions. This tests for accurate conditional flow management.

(assert_malformed
  (module
    (func $test
      (if (i32.const 1)
        (then (nop))
        (else (if (i32.const 0) (then) (else (nop))))
      )
    )
  )
)