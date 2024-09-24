;; Test 2: Create an `if` block containing an inner `loop` with a `br_table` instruction jumping to multiple nested levels. Given different branch targets, ensure the correct block is entered without unintended exit. This test should highlight issues in nested block control flow and condition evaluation.

(assert_invalid
  (module
    (func
      (i32.const 1)
      (if (result i32)
        (then
          (loop (result i32)
            (br_table 0 1 (i32.const 0))
          )
        )
        (else
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)