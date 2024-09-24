;; 6. Develop a case with an `if` block nested inside another `if` block, which contains a `br 1` instruction targeting the outer block. This tests the relative label look-up in nested conditional branches.

(assert_invalid
  (module
    (func
      (block
        (i32.const 0)
        (if
          (i32.const 0)
          (if
            (then (br 1))
          )
        )
      )
    )
  )
  "unknown label"
)