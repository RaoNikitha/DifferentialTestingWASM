;; 3. Place an `unreachable` within a nested `block` followed by a `br` instruction to an outer block. Tests if `br` properly exits to the correct block level skip the remaining instructions after the `unreachable`.

(assert_invalid
  (module
    (func (block
      (block
        (unreachable)
        (br 1)
      )
      (i32.const 0)
    ))
  )
  "type mismatch"
)