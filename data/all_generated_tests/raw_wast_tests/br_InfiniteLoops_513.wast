;; 4. **Test Description:**    A loop with a `br` instruction targeting a label within the loop itself. Verify if the instruction correctly results in a backward jump to the loop's beginning, rather than an infinite loop due to incorrect label indexing.

(assert_invalid
  (module
    (func (result i32)
      (loop $label (result i32)
        (br $label)
      )
    )
  )
  "unknown label"
)