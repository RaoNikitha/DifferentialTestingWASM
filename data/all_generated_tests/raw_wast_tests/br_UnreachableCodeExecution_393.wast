;; 4. A sequence where a `block` encapsulates an `if` construct that contains a `br` instruction targeting the block, with an `unreachable` instruction after the `if` block. This checks if branching out of an `if` correctly bypasses unreachable code.

(assert_invalid
  (module
    (func 
      (block 
        (if 
          (i32.const 1) 
          (then 
            (br 1)
          )
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)