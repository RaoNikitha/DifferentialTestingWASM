;; Create a differential test where the `br_table` involves index bounds right at the boundary (e.g., index = number of labels). Verify if such boundary values correctly revert to the default label, exposing issues in upper bound handling.

(assert_invalid
  (module
    (func
      (block
        (block
          (br_table 0 0 1 (i32.const 1))
        )
      )
    )
  )
  "unknown label"
)