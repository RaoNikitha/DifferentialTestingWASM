;; 4. Test `if`-`else` condition with `nop` in both branches, followed by `unreachable` in the true branch:    - `i32.const 1`    - `if`    - `nop`    - `unreachable`    - `else`    - `nop`    - `end`    - `i32.const 100`

(assert_invalid
  (module
    (func
      i32.const 1
      if
        nop
        unreachable
      else
        nop
      end
      i32.const 100
    )
  )
  "type mismatch"
)