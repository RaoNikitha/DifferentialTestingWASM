;; 8. Incorporate a `nop` immediately before a `br_table` where the table entries include mixed valid and invalid indices to check consistency in how the implementations handle mixed-index scenarios.

(assert_invalid
  (module (func $mixed-br_table (nop) (block (loop $loop (br_table 0 -1)))))
  "type mismatch"
)