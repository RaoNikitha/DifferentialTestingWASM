;; 3. Design a `loop` containing a nested `if` block, which itself contains a `br 2` instruction. This ensures that backward branches to the beginning of the loop from within the `if` block are correctly executed without violating nested control flow constraints.

(assert_invalid
  (module
    (func $test_nested_if_in_loop (result i32)
      (loop 
        (if (result i32)
          (then (br 2))
        )
      )
    )
  )
  "type mismatch"
)