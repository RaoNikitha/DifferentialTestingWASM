;; 5. **Test Description:**    A loop nested within a `block`, with the loop containing a `br` instruction targeting the `block`'s label. Confirm if execution resumes after the `block`'s `end`. An incorrect jump keeps the loop running endlessly.

(assert_invalid
  (module
    (func $test
      (block
        (loop
          (br 1)
          (br 0)
        )
      )
      nop
    )
  )
  "invalid branch target"
)