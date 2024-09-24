;; 1. Test a deeply nested block followed by a `br` instruction that targets the outermost block. The test ensures that the correct relative label is read, and as such, the outermost block is jumped to, verifying correct block nesting handling.

(assert_invalid
  (module
    (func $test-deep-nesting
      (block
        (block
          (block
            (block
              (br 3)
            )
          )
        )
      )
    )
  )
  "unknown label"
)