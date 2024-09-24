;; 2. A test using an `if` instruction where the `else` branch contains a `loop` with a `br_if` instruction that always evaluates to true, ensuring proper condition evaluation does not inadvertently create an infinite loop bypass.

(assert_invalid
  (module (func $type-if-else-loop-br_if (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 10))
      (else
        (loop (block
          (i32.const 0)
          (br_if 1 (i32.const 1))
        ))
        (i32.const 20)
      )
    )
  ))
  "type mismatch"
)