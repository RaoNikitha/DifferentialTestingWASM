;; 8. Verify behavior of `nop` in `loop` and use `br_if` to skip by `unreachable`:    - `i32.const 5`    - `loop`    - `nop`    - `br_if 0`    - `unreachable`    - `end`

(assert_malformed
  (module
    (func (result i32)
      (i32.const 5)
      (loop (result i32)
        nop
        (br_if 0 (i32.const 1))
        unreachable
      )
    )
  )
  "unexpected end of loop")