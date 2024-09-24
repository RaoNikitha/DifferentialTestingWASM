;; 10. **Test 10**: An `if` instruction where the `then` branch has a `br_table` instruction with an index that exactly matches the length of the targets list, testing edge index validity checks.

(assert_invalid
  (module
    (func
      (if (result i32) (i32.const 1)
        (then (i32.const 0) (br_table 0 1))
        (else (i32.const 2)))
    )
    (export "test" (func 0))
  )
  "br_table index out of bounds"
)