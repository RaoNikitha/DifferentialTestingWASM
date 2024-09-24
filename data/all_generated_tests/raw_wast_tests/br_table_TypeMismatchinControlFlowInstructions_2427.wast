;; 7. Test Description 7: Create a `br_table` instruction sequence that involves label targets nested within loop constructs, causing a type mismatch due to incorrect operand type assumptions at different nesting levels.

(assert_invalid
  (module
    (func $nested-loop-type-mismatch
      (block
        (loop (result i32)
          (br_table 0 0 (i32.const 1)) (nop)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)