;; 3. Design a structure with multiple nested `if` statements and place a `br` instruction within the innermost `if` to break to an outer `block`. Ensure the correct control flow after the outer `block`'s `end`. This helps to test the correct handling of `if` statements within nested `blocks`.

(assert_invalid
  (module
    (func
      (block 
        (block 
          (if 
            (then 
              (block 
                (block
                  (if 
                    (then (br 2))
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)