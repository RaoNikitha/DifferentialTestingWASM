;; - Create a nested conditional block where the inner condition should evaluate to false, preventing the execution of an `unreachable` instruction placed inside the true branch of the inner block. Test if incorrect condition evaluation leads to the trap.

(assert_invalid
  (module (func $nested-conditional-block
    (block $outer
      (br_if 0 (i32.const 0))
      (if (i32.const 0)
        (then (unreachable))
        (else (nop))
      )
    )
  ))
  "type mismatch"
)