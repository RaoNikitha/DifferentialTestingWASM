;; 6. **Test Description: Consecutive Labels**    - Define consecutive `block` structures and issue a `br` instruction targeting the label of the second block.

(assert_invalid
  (module
    (func (block (block (br 1))))
  )
  "label out of bounds"
)