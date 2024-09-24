;; 5. Place multiple `nop` instructions inside a `loop` with an unexpected end via `unreachable`. Check if stack state remains unchanged:    - `loop`    - `nop`    - `nop`    - `nop`    - `unreachable`    - `end`    - `i32.const 50`

(assert_invalid
  (module
    (func
      (loop
        nop
        nop
        nop
        unreachable
      )
      i32.const 50
    )
  )
  "type mismatch"
)