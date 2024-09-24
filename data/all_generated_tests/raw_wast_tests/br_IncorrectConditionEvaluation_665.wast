;; 6. **Test Description**: Set up an invalid branch target scenario where `br_if` conditions are mixed with `br` to verify when `br_if` conditions are wrongly targeting invalid labels due to incorrect condition evaluation.

(assert_invalid
  (module
    (func $invalid-br_if-condition
      (block
        (i32.const 1) (i32.const 0)
        (br_if 2 (br 0))
      )
    )
  )
  "unknown label"
)