;; 7. Devise a test scenario where the `br_table` instruction is placed within an `if` block, using the same default label for both possible branches. Check for stack underflow situations.

(assert_invalid
  (module
    (func $br_table_if_stack_underflow (result i32)
      (block (result i32)
        (i32.const 0)
        (if (result i32)
          (then 
            (br_table 1 1)
          )
          (else 
            (br_table 1 1)
          )
        )
        (drop)
      )
    )
  )
  "type mismatch"
)