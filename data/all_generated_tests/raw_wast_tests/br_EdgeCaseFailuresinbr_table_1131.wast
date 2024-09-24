;; 2. **Out-of-Bounds Index:**    - Provide a `br_table` instruction with an index that exceeds the highest available target. This checks if the implementation properly handles out-of-bounds conditions by falling through to the default label.    - **Constraint:** Ensures that out-of-bounds indices do not cause unintended behavior or crashes.

(assert_invalid
  (module
    (func $out-of-bounds-br_table-index
      (block $label0
        (br_table 1 (i32.const 0))
      )
    )
  )
  "unknown label"
)