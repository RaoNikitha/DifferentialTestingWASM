;; 7. Construct a `br_table` with an empty target list and intersperse with multiple `nop` instructions. This checks if both implementations correctly handle empty target lists and multiple no-ops without failing.

(assert_invalid
  (module
    (func
      (block (br_table (nop) (nop) (nop) (block (br_table (br_table (nop) (nop) (nop))))))))
  "br_table targets list must not be empty"
)