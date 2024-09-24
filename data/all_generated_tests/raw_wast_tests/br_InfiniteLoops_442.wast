;; 3. Implement a loop where the `br` instruction should go to the beginning of another loop within the same scope but fails to do so due to improper label indexing. This can create a scenario where the program loops infinitely without correctly targeting the intended loop.

(assert_invalid
  (module
    (func $nested-loops-incorrect-label-indexing
      (loop $outer
        (loop $inner
          (br 2)
        )
      )
    )
  )
  "unknown label"
)