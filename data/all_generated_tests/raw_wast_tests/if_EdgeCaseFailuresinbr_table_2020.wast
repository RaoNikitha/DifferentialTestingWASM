;; 1. Test an `if` instruction where the `br_table` inside the `then` block has an index that is exactly equal to the number of available branch targets, and check if both implementations handle the boundary correctly.

(assert_invalid
  (module
    (func $br_table-boundary (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (block (br_table 0 0))
          (i32.const 42)
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "br_table index out of range"
)