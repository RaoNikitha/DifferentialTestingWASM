;; 10. Create an `if-else` structure where the `else` block contains a `br_table` instruction with an index referring to a negative value, checking the implementations’ consistency in handling illegal indices.

(assert_invalid
  (module
    (func $test
      (if (result i32)
        (i32.const 1)
        (then (i32.const 0))
        (else (block (br_table -1 0) (i32.const 0)))
      )
    )
  )
  "invalid br_table target"
)