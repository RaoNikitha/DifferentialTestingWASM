;; 5. Develop a test case with a `loop` that includes several `nop` instructions and `br_table` with indices close to the upper bound and beyond. Check if the loop exits correctly without creating unexpected states or errors.

(assert_invalid
  (module
    (func (loop (nop) (nop) (nop) (br_table 1 1 1 1 1 (i32.const 0)))))
  "invalid br_table target"
)