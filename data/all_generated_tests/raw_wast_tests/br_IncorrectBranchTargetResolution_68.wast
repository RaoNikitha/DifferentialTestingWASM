;; 9. Formulate a nested environment where an `if` conditional within a `loop` uses `br` to exit to the outer `loop` label. Ensure correct label indexing and correct backward jump handling.

(assert_invalid
  (module
    (func
      (loop
        (if (i32.const 1)
          (then (br 1))
        )
      )
    )
  )
  "unknown label"
)