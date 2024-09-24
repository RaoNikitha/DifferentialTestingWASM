;; Test a sequence where an `if` condition evaluates to true, executes a block of code, and loops back to check another `if` condition leading to an `unreachable` instruction. This checks the control flow in iterative `if` scenarios.

(assert_invalid
  (module (func $looping-if-unreachable (result i32)
    (block (loop
      (if (result i32)
        (i32.const 1)
        (then
          (if (i32.const 1)
            (then (unreachable))
            (else (unreachable))
          )
        )
        (else (br 1))
      )
    )))
  )
  "type mismatch"
)