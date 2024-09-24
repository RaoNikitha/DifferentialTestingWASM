;; 3. Design an `if` statement where the `then` block contains a `br_table` instruction with an index significantly larger than the number of branch targets, to see if it triggers a consistent error handling.

(assert_invalid
  (module
    (func $test-large-br_table
      (if
        (i32.const 1)
        (then
          (br_table 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 999 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)