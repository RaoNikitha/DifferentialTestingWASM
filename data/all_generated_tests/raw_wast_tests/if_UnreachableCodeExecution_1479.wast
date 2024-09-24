;; 10. Construct an `if` with a false condition leading to an `else` block that contains another layer of erroneous `br` and `br_if` statements erroneously targeting the end of the `if`, combined with an `unreachable` instruction to test breaking correctness.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 0)
      (if (result i32)
        (then (i32.const 1))
        (else
          (br 0)
          (br_if 1 (i32.const 0))
          (unreachable)
        )
      )
    )
  )
  "incorrect br and br_if usage"
)