;; 7. Insert a `br_table` instruction within a block that contains various nested blocks and loops. Target a label in the `br_table` that references a label index outside all nesting levels, which serves as a default escape route. This test evaluates correct handling of exiting multiple nested constructs.

(assert_invalid
  (module (func $nested-blocks-with-br_table
    (block
      (loop
        (block
          (block
            (br_table 0 4 (i32.const 1))
          )
        )
      )
    )
  ))
  "unknown label"
)