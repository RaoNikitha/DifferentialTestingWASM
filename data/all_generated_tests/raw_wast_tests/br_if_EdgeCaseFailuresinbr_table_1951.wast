;; Test 2: Implement a nested control flow where `br_table` is used to reference a label index higher than available labels, checking if the implementation catches the error or branches incorrectly.

(assert_invalid
  (module
    (func
      (block
        (i32.const 1)
        (br_table 0 1) ;; This should cause an invalid error due to label index out of bounds
      )
    )
  )
  "unknown label"
)