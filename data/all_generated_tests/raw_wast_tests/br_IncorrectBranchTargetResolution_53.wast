;; 4. **Test Description: Forward Branch Out of Conditional**    - Use an `if` block with a `br` instruction that targets a `block` outside the `if` structure.

(assert_invalid
  (module
    (func
      (block
        (if (result i32)
          (then (br 1 (i32.const 1)))
        )
      )
    )
  )
  "type mismatch"
)