;; Employ nested `if` statements with `blocks`. Erroneously target a `br` instruction to an outer `block`, bypassing the stack's type validation. Validate consistency with an `unreachable` instruction placed immediately afterward. Compare differences in how this erroneous branch target is trapped.

(assert_invalid
  (module (func $type-if-block-br-unreachable
    (block $outer
      (if (i32.const 1)
        (then
          (block $inner
            (br $outer)
            (unreachable)
          )
        )
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)