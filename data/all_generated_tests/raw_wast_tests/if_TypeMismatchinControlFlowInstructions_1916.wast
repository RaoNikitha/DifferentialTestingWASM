;; Create a test with an `if` instruction without a block type, where the `then` branch contains an instruction sequence producing two outputs (`i32` and `i32`), and the `else` branch ensures an implicit type mismatch by producing (`i64`). This checks the implementations' handling of implicit block types and stack enforcement.

(assert_invalid
  (module (func
    (if
      (i32.const 1)
      (then (i32.const 1) (i32.const 2))
      (else (i64.const 3))
    )
  ))
  "type mismatch"
)