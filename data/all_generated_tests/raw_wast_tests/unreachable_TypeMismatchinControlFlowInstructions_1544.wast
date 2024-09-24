;; 5. Start with a `br` instruction to break to a block that contains `unreachable`, followed by a `f64.div` instruction that would otherwise cause a type constraint violation, to check for type-checking on block breaks.

(assert_invalid
  (module (func $test_br_unreachable 
    (block
      (br 0)
      (block (unreachable))
    )
    (f64.div)
  ))
  "type mismatch"
)