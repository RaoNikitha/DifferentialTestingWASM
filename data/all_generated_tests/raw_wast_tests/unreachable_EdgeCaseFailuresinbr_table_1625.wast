;; 6. Create a nested structure where an outer block has a `br_table` that branches to an inner block containing an `unreachable`. This ensures the `unreachable` directive within the nested structure correctly causes a trap.

(assert_invalid
  (module (func (block (br_table 0 (block (unreachable)))))
  )
  "type mismatch"
)