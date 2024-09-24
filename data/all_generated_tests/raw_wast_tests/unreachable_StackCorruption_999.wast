;; 10. Construct a sequence where `unreachable` is nested within multiple levels of control structures (`loop`, `block`). Ensure stack disruption is consistent, and no intermediate stack states cause corruption when the unreachable instruction is executed.

(assert_invalid
  (module (func $type-unreachable-nested-control
    (block
      (loop
        (if (i32.const 1)
          (then
            (unreachable)
            (i32.const 0)
          )
        )
      )
    )
  ))
  "type mismatch"
)