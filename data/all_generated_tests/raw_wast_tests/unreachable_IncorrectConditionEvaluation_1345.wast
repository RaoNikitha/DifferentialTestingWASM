;; - Design a scenario with a conditionally executed `call` to a function containing an `unreachable` instruction. The condition should be false but if incorrect, validate if the `unreachable` instruction in the function gets executed.

(assert_invalid
  (module
    (func $cond_call (param i32) (result i32)
      (if (local.get 0)
        (then (call $unreachable_func))
      )
      (i32.const 42)
    )
    (func $unreachable_func
      (unreachable)
    )
  )
  "unreachable instruction executed"
)