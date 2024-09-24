;; Test 3: Embed `nop` within nested `if` and `else` blocks where the `else` block contains an `unreachable`. Validate that none of the `nop` instructions prevent reaching the `unreachable` when the `else` block is executed.

(assert_malformed
  (module
    (func (result i32)
      (if (i32.const 0)
        (then
          (nop)
        )
        (else
          (nop)
          (unreachable)
        )
      )
    )
  )
  "unreachable"
)