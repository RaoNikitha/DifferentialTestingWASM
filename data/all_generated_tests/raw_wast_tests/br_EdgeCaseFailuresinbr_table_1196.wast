;; 7. Incorporate a `br_table` with valid targets and another index explicitly set to -1 to evaluate negative index handling within the target range. This ensures proper negative index management in mixed scenarios.

(assert_invalid
  (module (func $br_table-negative-index
    (block (br_table -1 0 1 (i32.const -1)) (i32.const 1))
  ))
  "invalid label index"
)