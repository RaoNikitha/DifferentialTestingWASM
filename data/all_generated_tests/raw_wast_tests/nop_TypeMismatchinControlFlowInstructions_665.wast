;; Place `nop` within nested control instructions (`block` inside `loop` or vice versa), ensuring outer and inner constructs rely on specific stack states that get disrupted by the `nop`'s presence. Verify if wizard_engine catches the type infusion correctly.

(assert_invalid
  (module
    (func $nested-control
      (block (result i32)
        (loop (result i32)
          nop
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)