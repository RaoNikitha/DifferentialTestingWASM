;; Construct a nested `block` inside an `if` instruction where the `if` specifies an `i32` output, but the inner `block` within `then` clause attempts to exit with a mismatched type like `f64`. This verifies the type alignment between nested blocks within an `if` control statement.

(assert_invalid
  (module
    (func $type-nested-block-mismatch
      (if (result i32) (i32.const 1)
        (then
          (block (result i32) (f64.const 1) (br 0))
        )
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)