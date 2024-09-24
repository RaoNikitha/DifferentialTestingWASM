;; 1. **Test Descriptions:**  2. A function containing multiple nested blocks and placing a `nop` instruction at the start, middle, and end of these blocks to ensure that the control flow proceeds correctly through the nested structures without modification. The trace should confirm that all `nop` instructions are skipped and the control reaches the intended exit points.

(assert_invalid
  (module
    (func $test
      (block
        (block
          (nop)
          br 0
          (nop))
        (block
          (nop)
          (loop
            (nop)
            br 1))
        (nop)
        (block
          (nop)))
      (nop))
    (block
      (nop)))
  "type mismatch"
)