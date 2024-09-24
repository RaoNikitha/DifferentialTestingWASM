;; 7. Insert `nop` followed by `unreachable` in a nested control flow context under `if`:    - `i32.const 2`    - `if`    - `block`    - `nop`    - `unreachable`    - `end`    - `end`    - `i32.const 20`

(assert_invalid
  (module
    (func (result i32)
      (i32.const 2)
      (if (result i32)
        (then
          (block (result i32)
            (nop)
            (unreachable)
          )
        )
      )
      (i32.const 20)
    )
  )
  "type mismatch"
)