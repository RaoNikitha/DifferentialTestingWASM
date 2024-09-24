;; Create an `if` block with multiple nested blocks where the `if` condition uses a large negative index for the `br_table` instruction to force undefined behavior by exceeding available targets within both the `then` and `else` branches.

(assert_invalid
  (module
    (func $test
      (i32.const 0)
      (if
        (then
          (br_table -1 (i32.const 1))
        )
        (else
          (br_table -1 (i32.const 2))
        )
      )
    )
  )
  "unknown label"
)