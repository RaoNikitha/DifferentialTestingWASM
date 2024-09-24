;; Design a nested loop construct where a `br` instruction attempts to jump out of its enclosing loop to an invalid block index, leading to `unreachable` if label lookup fails.

(assert_invalid
  (module
    (func
      (block
        (loop
          (br 2)
        )
      )
    )
  )
  "unknown label"
)