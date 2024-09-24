;; 2. Test placing `nop` inside a block that ends with `unreachable`. Check if the block correctly traps without executing further instructions:    - `block`    - `nop`    - `unreachable`    - `end`    - `i32.const 1`

(assert_invalid
  (module
    (func $test
      (block
        nop
        unreachable
      )
      i32.const 1
    )
  )
  "type mismatch"
)