;; 4. **Test Description:** An `unreachable` placed inside a nested series of `block` and `loop` structures, with an attempt to execute further instructions outside these structures. This checks whether the `unreachable` trap interrupts execution as expected without affecting outer scope executions.        **Constraint Checked:** Control flow and execution halt at the innermost scope containing `unreachable`.

(assert_invalid
  (module
    (func $nested-block-loop-unreachable
      (block
        (loop
          (block
            (unreachable)
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)