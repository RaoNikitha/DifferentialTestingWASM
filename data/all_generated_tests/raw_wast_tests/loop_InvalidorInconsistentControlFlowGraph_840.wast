;; - Test with a loop that contains a nested block where a branch targets the outer loop. This checks if the CFG correctly handles the label indexing and branch target resolution in both implementations.

(assert_invalid
  (module
    (func $test-loop-nested-block-branch (result i32)
      (loop (result i32)
        (block
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)