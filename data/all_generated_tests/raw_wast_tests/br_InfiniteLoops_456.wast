;; Test a `loop` containing multiple nested `block` structures, where the innermost block has a `br` instruction targeting the outermost `block`. This ensures proper execution without inner structures creating an infinite loop.

(assert_invalid
  (module (func
    (loop (block (block (block 
      (br 3)
    ))))
  ))
  "label index out of range"
)