;; 10. Test a `loop` that should be entered with a specific operand type, but a `br` instruction in an inner block incorrectly enrolls a different type. This will validate the type enforcement for operands when the `br` instruction results in a backward branch to a loop start.

(assert_invalid
  (module (func $loop-type-mismatch
    (block
      (loop (result i32)
        (block
          (br 1 (i64.const 1))
        )
        (i32.const 0)
      )
    )
  ))
  "type mismatch"
)