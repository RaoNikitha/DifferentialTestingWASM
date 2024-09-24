;; Construct a nested block where a `br_if` instruction is placed right before the `end` of the inner block, targeting the outer block. This test is to verify that the branching correctly reaches the outer block and disregards any instructions between the `br_if` and `end`.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result i32) 
        (br_if 1 (i32.const 1))
        (i32.const 2)
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)