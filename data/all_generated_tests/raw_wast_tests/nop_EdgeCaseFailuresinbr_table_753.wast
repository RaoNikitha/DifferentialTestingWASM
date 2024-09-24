;; 4. Place multiple `nop` instructions consecutively before a `br_table` that is supposed to fall back on a default label if the index is out of bounds, checking if the fall-back mechanism is consistently handled.

(assert_invalid
  (module
    (func $test-br_table (nop) (nop) (nop) (br_table 0 1 2 3))
  )
  "br_table out of bounds"
)