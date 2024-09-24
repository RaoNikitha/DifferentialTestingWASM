;; Test 7: Embed a `br_if` instruction within an `if-else` control structure interspersed with `nop` instructions and ensure the branch condition is evaluated accurately.

(assert_invalid
  (module
    (func $test-7
      (local i32)
      nop
      (if (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 0))
        (then (nop) (i32.const 2))
        (else (nop) (i32.const 3))
      )
    )
  )
  "type mismatch"
)