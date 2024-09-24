;; Place a `nop` instruction inside a `loop` structure that performs stack operations, ensuring the loop body encounters type mismatches due to intervening stack manipulations. Validate if wizard_engine incorrectly passes the mismatched structure.

(assert_invalid
  (module
    (func $test-loop (result i32)
      (loop $L
        (i32.const 0)
        (nop)
        (br_if $L)
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)