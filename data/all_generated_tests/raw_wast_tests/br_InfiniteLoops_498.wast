;; 9. **Cross-Block Unconditional Branches**: Develop a block that encloses multiple loops with a `br` instruction attempting to branch to a label outside the nearest loop, ensuring it properly targets the correct label index and avoids infinite looping by improperly targeting outer structures.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (block
            (br 2) ;; Attempting to branch to outer block
          )
        )
      )
    )
  )
  "type mismatch"
)