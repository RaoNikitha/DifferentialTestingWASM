;; 7. Misaligned branch from within loops:    Introduce an inner loop within an outer loop, where `br` targets a label supposedly in the outer loop but logically associated with the inner loop. This ensures proper handling of backtracking CFG and relative indexing.

(assert_invalid
  (module
    (func (block (loop (block (br 2))))))
  "unknown label"
)