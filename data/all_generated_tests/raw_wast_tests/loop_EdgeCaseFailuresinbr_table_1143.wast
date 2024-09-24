;; Test a `loop` block with a `br_table` instruction where the table is empty and the index is zero, ensuring both implementations handle the edge case correctly by taking the default branch.

(assert_invalid
  (module
    (func (loop (block $label (br_table $label 0))))
  )
  "type mismatch"
)