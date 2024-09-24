;; 3. **Test for Misinterpreted Label Index:**    - Use deeply nested control structures with multiple nested `block`, `loop`, and `if` instructions and branches to ensure that label indices are correctly interpreted for each `br` instruction.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (br 5)
              )
              (i32.const 1)
            )
          )
        )
      )
    )
  )
  "type mismatch or invalid label"
)