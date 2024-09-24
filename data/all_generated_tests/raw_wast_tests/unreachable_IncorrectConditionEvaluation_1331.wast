;; Introduce a `br_if` within an `if-else` construct, where the `unreachable` instruction directly follows the `else` block. The `br_if` should not skip the unreachable trap if the condition is false.

(assert_invalid
  (module
    (func
      (block
        (if (i32.const 0)
          (then)
          (else
            unreachable
          )
        )
        (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)