;; 2. Use a `br_table` with exactly one label target and an index of one, which is out of bounds, then insert a `nop`. This will verify how each implementation handles single-target branch tables with invalid indices.

(assert_invalid
  (module
    (func (block $label (br_table $label (i32.const 1)) (nop)))
  )
  "out of bounds"
)