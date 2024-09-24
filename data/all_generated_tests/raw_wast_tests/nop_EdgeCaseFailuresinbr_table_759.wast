;; 10. Add a `nop` before a `br_table` whose indices are constructed to directly value-wrap the bounds (e.g., by modular arithmetic) to validate how both implementations handle boundary wrapping without impacts from the `nop`.

(assert_invalid
  (module
    (func (block (nop) (br_table 0 0 (i32.const 1)) (unreachable)))
  )
  "type mismatch"
)