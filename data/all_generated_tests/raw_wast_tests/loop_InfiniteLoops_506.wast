;; 7. Implement a `br_table` within a loop that causes a branch to a default label meant to exit the loop but through incorrect stack handling, always remains in the loop.

(assert_invalid
  (module (func $br-table-loop-stack-error
    (block (loop (br_table 0 1 (i32.const 1) (br 1)))
  ))
  "type mismatch"
)