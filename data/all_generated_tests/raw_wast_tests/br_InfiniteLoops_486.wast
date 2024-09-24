;; 7. Mixed `loop` and `block` structures with a `br` instruction targeting a `block` inside another `loop`. Ensure that block exits do not mistakenly result in continuing the outer loop leading to an infinite loop scenario.

(assert_invalid
  (module
    (func (loop (block (br 1))))
  )
  "type mismatch"
)