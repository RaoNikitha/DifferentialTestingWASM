;; 8. Design a test that involves a `br` instruction within a `block` that targets a deeply nested `if` block, ensuring stack unwinding for both the `block` and `if` structure is handled without corruption.

(assert_invalid
  (module
    (func $test-deep-nesting
      (block
        (block
          (i32.const 0)
          (if (result i32)
            (then
              (block
                (br 2)
                (i32.const 1)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)