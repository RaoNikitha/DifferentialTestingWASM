;; 9. Craft a `br_table` contained within three nested blocks of different types where each block has its labels, and the operand references a label in the first block. The test checks for the correct identification and utilization of labels across varying nested control flow constructs.

(assert_invalid
  (module (func $nested-blocks-label
    (block
      (block
        (block (result i32)
          (br_table 0 1 2 (i32.const 0))
        )
      )
    )
  ))
  "type mismatch"
)