;; 3. Use a `br_table` instruction with a vector of labels that include both valid and invalid (not previously defined) labels. The invalid labels should cause a CFG inconsistency, revealing how each implementation handles undefined label references.

(assert_invalid
  (module
    (func $invalid-label
      (block
        (i32.const 0)
        (br_table 0 1 (i32.const 2)) ; invalid label reference
      )
    )
  )
  "unknown label"
)