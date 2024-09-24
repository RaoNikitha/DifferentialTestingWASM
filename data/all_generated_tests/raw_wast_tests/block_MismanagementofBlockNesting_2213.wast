;; 4. **Mismatched Block Ends**:    Define multiple nested blocks and intentionally omit the `end` instruction for one block, leading to an incorrect nesting depth. This will test how the implementation handles improper closure of block structures.

(assert_invalid
  (module (func $mismatched-block-end
    (block
      (block
        (nop)
      ;; omitted end
  )))
  "unexpected end of section"
)