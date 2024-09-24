;; 6. Construct a test using nested `block` instructions with a `br_table` instruction to conditionally branch to one of the nested blocks. Verify the correct block is targeted based on the condition, and that stack management is accurate before continuing execution. Constraints checked: correct dispatch logic for conditional branches, stack restoration.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 0 1 2 (i32.const 0))
          (i32.const 10)
        )
        (i32.const 20)
      )
      (i32.const 30)
    )
  ))
  "type mismatch"
)