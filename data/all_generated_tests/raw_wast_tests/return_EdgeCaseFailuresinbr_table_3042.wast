;; 1. **Test for Out of Bounds Index Handling**:    - **Description**: Create a `br_table` instruction with an index that exceeds the number of target labels. This test checks how each implementation handles indices that are out of bounds and whether the return instruction properly unwinds the stack in such scenarios.    - **Relation to Edge Case**: Ensures that both WebAssembly and Wizard Engine handle invalid indices gracefully without causing undefined behavior when executing `return`.

(assert_invalid
  (module
    (func $br_table-out-of-bounds
      (block $label0 (block $label1 (block $label2 (return))))
      (br_table $label0 $label1 $label2 3)
    )
  )
  "index out of bounds"
)