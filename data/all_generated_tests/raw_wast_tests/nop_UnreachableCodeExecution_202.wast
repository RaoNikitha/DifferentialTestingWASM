;; 3. Validate proper handling of `nop` within a `loop` construct, followed by `br` to skip over an `unreachable` instruction:    - `loop`    - `nop`    - `br 0`    - `unreachable`    - `end`    - `i32.const 10`

(assert_invalid
  (module
    (func $loop-with-br 
      (loop (nop) (br 0) (unreachable)) 
      (i32.const 10)
    )
  )
  "unreachable executed"
)