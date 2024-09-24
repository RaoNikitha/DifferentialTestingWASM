;; 7. Test a `br_table` instruction with non-integer indices through indirect means (like computing through other operations) to ensure the implementation supports integer-only index values correctly and avoids improper casting or errors.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (br_table 0 1 (i32.add (i32.const 1) (i32.const 1)))
      )
    )
  )
  "type mismatch"
)