;; 3. **Deeply Nested Blocks with `br` Targeting Outermost Block Passing Through Unreachable Code:**    - Construct deeply nested blocks where a `br` instruction in an innermost block targets the outermost block and is followed by an `unreachable` instruction.    - This checks the accurate handling of deeply nested label indexing, ensuring `br` skips unreachable code.

(assert_invalid
  (module 
    (func $deeply_nested (result i32) 
      (block
        (block
          (block
            (unreachable)
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)