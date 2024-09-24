;; 1. Insert a `nop` instruction before a `br_if` that checks if a zero value should branch. Verify if the branch occurs unexpectedly, indicating a condition mis-evaluation due to the `nop`.

(assert_invalid
  (module
    (func
      (block
        (nop)
        (br_if 0 (i32.const 0))
      )
    )
  )
  "unknown label"
)