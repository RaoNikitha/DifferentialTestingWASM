;; 5. **Test 5: Nested `br_table` With `nop` in Middle And Mixed Valid/Invalid Indices**    - Use nested `br_table` instructions with a `nop` instruction placed between them, mixing both valid and invalid indices. This tests the ability of `nop` to coexist amidst complex control flows.    - Constraint: Ensure that `nop`'s presence does not alter the handling of multiple branching scenarios.

(assert_invalid
  (module 
    (func $nested_br_table
      (block $outer 
        (loop $inner
          (br_table 0 $outer (nop) 1)
        )
      )
    )
  )
  "expected index or label"
)