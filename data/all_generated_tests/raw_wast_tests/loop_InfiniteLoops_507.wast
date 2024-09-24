;; 8. Create a sequence where a `loop` instruction is used with incorrect operand type conversions in backward branches, leading to an infinite loop due to unwinding errors.

(assert_invalid
  (module (func $infinite-loop-mismatch
    (i32.const 0)
    (loop $label1 (result i32)
      (br 0)
      (drop)
    )
  ))
  "type mismatch"
)