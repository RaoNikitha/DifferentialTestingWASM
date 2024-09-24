;; 6. **Conflicting Label Indices in Control Constructs**:    Define a scenario where conflicting label indices are present in nested control constructs (loop, block, and if). Specifically, test if the label indices within a loop are correctly resolved without interference from outer constructs.

(assert_invalid
  (module (func $conflict-label-indices
    (block $block
      (loop $loop
        (block $inner-block
          (br $loop)
        )
      )
      (br $block)
    )
  ))
  "label index mismatch"
)