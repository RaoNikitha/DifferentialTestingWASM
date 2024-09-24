;; 3. Test Description: **Single Label, Out of Bounds Index**    - **Constraint Checked:** Single target label with an out of bounds operand.    - **How it Relates:** The test passes an operand beyond the index of a single label to validate if the implementation correctly falls back to the default label.

(assert_invalid
  (module
    (func (block (br_table 0 1 (i32.const 2))))
  )
  "unknown label"
)