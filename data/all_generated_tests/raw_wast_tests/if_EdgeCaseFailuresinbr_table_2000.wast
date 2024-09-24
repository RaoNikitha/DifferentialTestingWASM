;; 1. **Test 1**: An `if` instruction with a simple condition followed by a `br_table` instruction where the index is exactly at the boundary of the table's targets.

(assert_invalid
  (module
    (func $boundary-br_table
      (if (result i32) (i32.const 1)
        (then 
          (br_table 0 (i32.const 0))
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)