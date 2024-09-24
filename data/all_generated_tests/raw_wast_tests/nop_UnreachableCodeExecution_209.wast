;; 10. Test `nop` within a `return` block, checking execution ends at `unreachable`:    - `block`    - `i32.const 1`    - `return`    - `nop`    - `unreachable`    - `end`    - `i32.const 45`

(assert_malformed
  (module
    (func
      (block
        (i32.const 1)
        (return)
        nop
        unreachable
      )
      (i32.const 45)
    )
  )
  "module parsing failed"
)