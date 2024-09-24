;; 6. **Backward Branching with Invalid Default Label**:     - Configure a `br_table` which mistakenly assumes an invalid default label. This tests if the validation correctly rejects or defaults wrongly causing the loop never to exit.

(assert_invalid
  (module
    (func $backward-branch-invalid-default
      (block (loop $loop (br_table 0 0 10 (i32.const 1))))
    )
  )
  "unknown label"
)