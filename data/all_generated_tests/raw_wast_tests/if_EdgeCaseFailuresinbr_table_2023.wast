;; 4. Incorporate a nested `if` instruction inside another `if` where the nested `then` block has a `br_table` with an empty list of targets, checking if both implementations validate this scenario properly.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then 
          (if (then (br_table))))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)