;; 5. Test an invalid scenario where a `br` instruction targets a non-existent block label index, verifying if the implementation gracefully handles label lookup failures without mismanaging the block control structures.

(assert_invalid
  (module (func $invalid-br-target
    (block (br 1))
  ))
  "unknown label"
)