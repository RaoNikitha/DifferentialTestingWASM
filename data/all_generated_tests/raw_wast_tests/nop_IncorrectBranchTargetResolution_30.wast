;; - Test Description 1: Create a function containing a loop with nested blocks where a `nop` instruction is placed immediately before a `br` instruction targeting a block inside the loop. Verify if the `nop` instruction disrupts the branch target resolution, causing the jump to an incorrect block.

(assert_invalid
  (module
    (func (loop (block (nop) (br 1))))
  )
  "invalid branch depth")