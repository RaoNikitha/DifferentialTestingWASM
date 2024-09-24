;; A `block` instruction calls a function that performs a branching operation to an outer block, and this function call happens within another nested block. This checks if the engines correctly handle return values and stack state when exiting nested blocks.

(assert_invalid
  (module
    (func $inner (param i32) (result i32)
      (block (result i32)
        (br 1 (local.get 0))
      )
    )
    (func $outer (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (call $inner (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)