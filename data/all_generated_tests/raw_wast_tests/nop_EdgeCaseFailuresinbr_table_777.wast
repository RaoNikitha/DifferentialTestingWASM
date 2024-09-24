;; 8. Set up a series with alternating `nop` and `br_table` instructions with an index that randomly falls within and out of bounds. Ensure that `nop` has no effect and both implementations maintain consistent control flow and error reporting.

(assert_invalid
  (module (func $test (block $label (nop) (br_table $label $label -1))))
  "element out of range"
)