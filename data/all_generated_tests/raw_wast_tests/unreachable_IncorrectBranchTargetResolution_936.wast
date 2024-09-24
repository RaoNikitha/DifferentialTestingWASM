;; Have a series of `if-else` branches with mismatched `br` target labels inside each conditional block. Use the `unreachable` instruction after these misplaced branches. Ensure that incorrect label target resolution traps in WebAssembly environment match the wizard_engine implementation behavior.

(assert_invalid
  (module (func
    (block $outer
      (if (i32.const 1)
        (then
          (br $outer)
          (unreachable)
        )
        (else
          (block $inner
            (br $outer)
            (unreachable)
          )
        )
      )
    )
  ))
  "type mismatch"
)