;; 9. Test a `br` instruction used within a `block` that points to a `loop` label:    - **Constraint Checked**: Appropriate outward branching to `loop` from within a `block`.    - **Incorrect Branch Target**: Faulty resolution could end up in unintended blocks.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (br 1)
          (i32.const 0)
        )
        (i32.const 1)
      )
    )
  )
  "unknown label"
)