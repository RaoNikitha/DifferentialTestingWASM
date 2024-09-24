;; 2. Construct a function containing a sequence of `nop` instructions followed by a `br_table` instruction with an index greater than the number of targets. Verify if the `nop` instructions influence the handling and validation of the out-of-bounds index scenario.

(assert_invalid
  (module
    (func (block (br_table 1 0)))
    (nop)
    (nop)
    (nop)
    (nop)
    (nop)
  )
  "out-of-bounds index"