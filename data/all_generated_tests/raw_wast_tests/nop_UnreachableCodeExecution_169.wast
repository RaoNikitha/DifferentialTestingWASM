;; 10. Insert a `nop` instruction within a function that consists of complex control flow involving multiple `br` and `br_if` instructions finally leading to an `unreachable`. Confirm proper control transitions excluding the `unreachable` execution unless intended.

(assert_invalid
  (module 
    (func $complex-control 
      (block 
        (br 0) 
        (nop) 
        (br 0)
        (nop)
      )
      (unreachable)
    )
  )
  "unexpected unreachable"
)