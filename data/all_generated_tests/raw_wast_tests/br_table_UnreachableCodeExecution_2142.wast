;; Create a `br_table` with multiple nested blocks where the correct label index causes control to move to an invalid nested block containing an `unreachable` instruction. This test checks if the relative label indexing within nested blocks is handled consistently and correctly.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (loop
              (br_table 0 1 2 (i32.const 3)) ;; Invalid: `loop` and `block`s have different result types
            )
            (unreachable)
          )
        )
      )
    )
  )
  "type mismatch"
)