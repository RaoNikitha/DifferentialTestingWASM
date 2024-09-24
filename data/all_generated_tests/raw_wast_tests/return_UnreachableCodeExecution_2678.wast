;; **Test 7**: Design a function with multiple early `return`s within different contexts (loops, branches) and place an `unreachable` instruction as the last instruction. `Unreachable` should not be executed if any returns are correctly handled. *Constraint Checking*: Ensures multi-context early termination via `return`.

(assert_invalid
  (module
    (func $multiple-early-returns-with-unreachable
      (block
        (loop
          (br_if 0 (i32.const 1))
          (return (i32.const 1))
        )
        (br 0)
        (return (i32.const 2))
      )
      (unreachable)
    )
  )
  "type mismatch"
)