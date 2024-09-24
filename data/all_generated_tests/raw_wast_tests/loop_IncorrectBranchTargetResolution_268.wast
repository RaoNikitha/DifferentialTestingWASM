;; 9. **Multiple Loop Branches Same Label**:    Develop a sequence where multiple loops share the same label for branching instructions. Test for correct branch target resolution within each loop independently, ensuring no cross-loop label resolution errors.

(assert_invalid
  (module
    (func $test-loop-same-label
      (result i32)
      (loop $L1
        (br $L1)
      )
      (loop $L1
        (br $L1)
      )
    )
  )
  "invalid label"
)