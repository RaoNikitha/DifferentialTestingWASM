;; 6. Implement a function with multiple `nop` instructions interleaved with conditional branches `br_if`. Check if the branching logic is consistently followed, and note any discrepancies where incorrect conditions lead to wrong execution paths.

(assert_invalid
  (module
    (func $test-func
      (block
        (nop)
        (br_if 0 (i32.const 1))
        (nop)
        (br_if 0 (i32.const 0))
        (nop)
      )
    )
  )
  "invalid branch or label"
)