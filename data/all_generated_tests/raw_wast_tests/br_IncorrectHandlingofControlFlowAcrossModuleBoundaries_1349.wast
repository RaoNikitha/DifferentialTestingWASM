;; 10. **Test Description:** Define two modules, one with an exporting function containing a `br` instruction inside nested loops, and the other module calling this function. Validate if the control flow exits the correct nested loop based on the branch target.     - **Constraint:** Verifies control flow exit points for nested loops in exported functions.     - **Relation:** Ensures nested loop control flow targets are accurately interpreted across module boundaries.

(assert_invalid
  (module
    (func (export "testFunc")
      (loop (label $outer
        (loop (label $inner
          (br $outer)
        ))
      ))
    )
    (func (call 0))
  )
  "invalid use of label"
)