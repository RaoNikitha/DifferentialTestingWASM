;; Function implementing a switch-case structure with multiple cases leading to a `return` instruction, assessing that each `return` exits the function despite the nested case labels.

(assert_invalid
  (module
    (func $type-return-case-mismatch (result i32)
      (i32.const 3)
      (block (result i32)
        (block (result i32)
          (br_table 0 1 2 3 
            (i32.const 2)
            (return (i32.const 0))
            (i32.const 1)
            (return (f32.const 1.0))
          )
        )
      )
    )
  )
  "type mismatch"
)