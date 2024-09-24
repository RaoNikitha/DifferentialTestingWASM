;; 6. Use `nop` within nested `block` structures where an inner block ends with `unreachable`:    - `block`    - `block`    - `nop`    - `unreachable`    - `end`    - `i32.const 3`    - `end`

(assert_invalid
  (module
    (func $block-nop-test (result i32)
      (block
        (block
          (nop)
          (unreachable)
        )
        (i32.const 3)
      )
    )
  )
  "unreachable executed"
)