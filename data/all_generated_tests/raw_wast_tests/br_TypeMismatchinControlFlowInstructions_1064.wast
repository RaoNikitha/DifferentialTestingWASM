;; 5. **Test for Branch to an Incorrect Result Type Block:**    Implement a block producing an `i64` value and use a `br` instruction in a block requiring an `i32` value, ensuring the test captures any type mismatches between branches to blocks with different result types.

(assert_invalid
  (module
    (func
      (block (result i64)
        (i32.const 1)
        (br 0)
      )
    )
  )
  "type mismatch"
)