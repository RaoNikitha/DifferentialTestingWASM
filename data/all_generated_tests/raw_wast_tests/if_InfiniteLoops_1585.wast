;; 6. Build a test with a nested `if` instruction within a loop, where improper stack unwinding from an outer level `else` block manipulates conditions inaccurately ensuring the break condition never meets. This identifies loop-influencing state errors.

(assert_invalid
  (module (func $nested-if-outer-else-manip (result i32)
    (loop (result i32)
      (if (result i32) (i32.const 1)
        (then
          (if (result i32) (i32.const 0) (then (br 1 (i32.const 1))) (else (i32.const 1)))
          (i32.const 0)
        )
        (else (i32.const 1))
      )
    )
  ))
  "type mismatch"
)