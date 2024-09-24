;; 8. A test involving nested `if` statements within a loop where the inner `if` should break a loop based on a calculated condition, but incorrect stack management causes an infinite loop:    ```    (loop $outer      (if (i32.const 1)        (then           (if (i32.const 1)            (then (br $outer))          )        )      )    )    ```    This targets the handling of multiple nesting within loops where each `if` condition needs correct evaluation to avoid indefinite execution.

(assert_invalid
  (module
    (func $nested-if-loop
      (loop $outer
        (if (result i32)
          (i32.const 1)
          (then
            (if (result i32)
              (i32.const 1)
              (then
                (br $outer)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)