;; 6. **Cross Conditional Loops**: Formulate a function blending nested `if` blocks within `loop` structures, with the `return` lodged within the `else` part of the innermost `if`. The test probes if the `return` respects the accurate control flow, ensuring conditional paths don’t disrupt proper function exit.

(assert_invalid
  (module
    (func $cross-conditional-loop (result i32)
      (loop
        (if
          (then (i32.const 1))
          (else (return))
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)