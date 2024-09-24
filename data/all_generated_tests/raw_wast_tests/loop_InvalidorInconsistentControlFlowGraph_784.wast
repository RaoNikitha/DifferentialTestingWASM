;; 5. **Jump to Invalid Label Index within a Loop**:    - Create a test where a `br` instruction within a `loop` incorrectly targets a non-existent label index. Ensure that both implementations handle invalid label indices appropriately and maintain a valid CFG.

(assert_invalid
  (module (func $invalid-br-label-within-loop
    (block
      (loop
        (br 2)
      )
    )
  ))
  "invalid label"
)