;; 7. **Test Description:** Introduce a `block` inside a `loop`, and place a `br` instruction in the block targeting the loop. The test verifies if the CFG maintains structural control and effectively resumes at the start of the loop, highlighting wizard_engine’s potential CFG inconsistencies with nested labels.

(assert_invalid
  (module
    (func $nested-loop-block
      (loop $loop_label
        (block
          (br 1)
        )
      )
    )
  )
  "unknown label"
)