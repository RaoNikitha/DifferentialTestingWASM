;; Construct a test where two `br_table` instructions exist within the same function, each with their unique label vectors but overlapping label indices. Test if the resolve works independently and correctly for each `br_table`, ensuring label index collisions do not misguide branch targets.

(assert_invalid
  (module
    (func $double-br-table
      (block
        (block (result i32)
          (br_table 0 1 (i32.const 0) (i32.const 0))
        )
        (block (result i32)
          (block
            (br_table 0 1 (i64.const 0) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)