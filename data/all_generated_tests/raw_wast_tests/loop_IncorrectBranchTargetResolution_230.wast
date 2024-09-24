;; 1. Test a `loop` instruction that contains multiple nested loops and conditional branches. Ensure the ending branch targets the innermost loop's start correctly.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      (loop (result i32)
        (loop (result i32)
          (br_if 1 (i32.const 0))
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)