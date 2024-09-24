;; 6. **Test: Misaligned Loop and Block Nesting with `br_if`**:    - **Description**: Create nested loops and blocks with `br_if` instructed to target an ambiguously defined middle label (e.g., pointing to both block and loop nested at the same level).    - **Constraint Checked**: Verifies correct label resolution in a complex nesting scenario.    - **Relation to Incorrect Branch Target Resolution**: Ensures engines resolve branches correctly when labels are defined in complex, nested structures, avoiding misrouting of control flow.

(assert_invalid
  (module
    (func $misaligned-loop-block
      (block
        (loop
          (br_if 1 (i32.const 1)) 
          (br_if 0 (i32.const 0))
        )
        (block (br_if 0 (i32.const 1)))
      )
    )
  )
  "label index out of bounds"
)