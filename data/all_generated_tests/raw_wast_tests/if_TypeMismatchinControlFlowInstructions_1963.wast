;; 4. Create an `if` instruction that takes an `i32` condition but nests a `block` within the `then` clause, which incorrectly declares and uses `f64` inputs and outputs. This examines nested instruction validation for type mismatches.

(assert_invalid
  (module
    (func $invalid-nested-block
      (if (result f64) (i32.const 1)
        (then 
          (block (result f64)
            (i32.const 1) (f64.const 0.0)
          )
        )
      )
    )
  )
  "type mismatch"
)