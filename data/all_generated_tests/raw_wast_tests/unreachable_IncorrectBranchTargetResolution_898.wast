;; 9. **Test Complex Control Flow Graph:** Create a complex control flow comprising multiple layers of blocks and conditional branches. Introduce `unreachable` at critical points and assert that any branching instruction respects the label resolution, identifying incorrect behavior if execution proceeds past `unreachable`.

(assert_invalid
  (module (func $complex-control-flow
    (block $outer
      (loop $inner
        (br_if $inner (i32.const 1))
        (br_if $outer (i32.const 0))
        (unreachable)
      )
    )
  ))
  "type mismatch"
)