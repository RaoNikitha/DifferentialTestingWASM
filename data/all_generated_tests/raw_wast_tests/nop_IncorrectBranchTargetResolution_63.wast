;; Test `nop` within a combination of `block` and `loop` control instructions interleaved with `br_if` branching to validate that branch conditions and targets are correctly handled, and confirm `nop` has no unintended effect on branch behavior.

(assert_invalid
  (module
    (func
      (block
        (loop
          (nop)
          (br_if 0 (i32.const 1))
        )
      )
    )
  )
  "invalid"
)