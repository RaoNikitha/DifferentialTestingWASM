;; 6. Construct a test where the `br` instruction is used within a sequence of `if` statements inside a `loop`, evaluating correct relative label indexing. Misinterpretation may result in failure to break the loop.

(assert_invalid
  (module
    (func
      (loop
        (if (i32.const 1)
            (if (i32.const 1)
                (br 2)
            )
        )
      )
    )
  )
  "unknown label"
)