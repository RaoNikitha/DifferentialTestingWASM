;; 2. Generate a `br_table` where the index is exactly one more than the largest valid target. Ensure that both implementations correctly fall back to the default target rather than attempting to access an invalid target.

(assert_invalid
  (module
    (func (block (block (br_table 0 1 (i32.const 2)))))
  )
  "unknown label"
)