;; 5. A test where the `if` condition evaluates to false, and the `else` block contains a `loop` instruction interspersed with an `if` instruction having a branch that never executes. This checks if the `else` block's nested label is managed correctly to avoid infinite loops.

(assert_invalid
  (module (func $nested-if-else-with-loop
    (i32.const 0)
    (if (result i32)
      (then (i32.const 1))
      (else
        (loop (result i32)
          (if (i32.eqz (i32.const 0))
            (then (br 1))
          )
          (i32.const 2)
        )
      )
    )
  ))
  "type mismatch"
)