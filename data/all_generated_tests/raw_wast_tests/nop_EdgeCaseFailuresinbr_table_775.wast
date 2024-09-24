;; 6. Create a function that consists of a `block` structure with interleaved `nop` and various target indices in `br_table`. Use indices that precisely match the number of targets and check for consistent behavior across implementations.

(assert_invalid
  (module
    (func (block
      (nop)
      (br_table 0 1 2 3)
      (nop)
      (br_table 2 1 0 3)
      (nop)
      (br_table 1 0 3 2)
      (nop)
    ))
  )
  "unknown label"
)