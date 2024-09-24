;; 10. **Test: Complex Nesting with Multiple `br_if` Instructions**:     - **Description**: Implement multiple nested blocks and loops with several `br_if` instructions, each targeting different levels of nesting depth to test accurate branching.     - **Constraint Checked**: Ensures each `br_if` instruction resolves correctly within complex nested structures.     - **Relation to Incorrect Branch Target Resolution**: Checks engines' abilities to resolve multiple, nested conditional branches correctly, maintaining proper control flow across multiple levels of nesting.

(assert_invalid
  (module
    (func $complex-nesting (result i32)
      (block (result i32)
        (loop (result i32)
          (block
            (br_if 1 (i32.const 0))
            (block (result i32)
              (br_if 0 (i32.const 1))
              (block (result i32)
                (br_if 3 (i32.const 1))
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)