;; 5. Construct nested `block` and `loop` pairs with closely indexed labels. Specifically, target the label of the second outermost `block` with a `br` instruction and verify correct label identification.

(assert_invalid
  (module
    (func
      (block (loop (block (block (br 2))))
    )
  )
  "unknown label"
)