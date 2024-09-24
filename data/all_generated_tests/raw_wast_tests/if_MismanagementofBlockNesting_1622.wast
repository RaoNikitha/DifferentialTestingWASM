;; Test 3: Construct a sequence where an `if` block is nested inside a `loop`, and within the `if`, another `if` and `loop` structure is defined. Evaluate if the operand stack maintains correct states without mismanaging the conditional and loop entries and exits.

(assert_invalid
  (module (func $nested-if-loop (result i32)
    (loop (result i32)
      (if (result i32) (i32.const 1)
        (then
          (loop (result i32)
            (if (result i32) (i32.const 1)
              (then (i32.const 42))
              (else (i32.const 0))
            )
          )
        )
        (else (i32.const -1))
      )
    )
  ))
  "type mismatch"
)