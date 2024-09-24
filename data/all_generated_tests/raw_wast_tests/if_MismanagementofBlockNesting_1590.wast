;; 1. **Nested `if` in `loop` with Forward Branch**: Validate an `if` instruction nested within a `loop` where a forward branch (`br`) points to a label higher than the `loop`. This will check if the nesting of `if` inside `loop` and the correct management of forward branches are implemented correctly.

(assert_invalid
  (module
    (func $nested_if_loop
      (loop 
        (if (i32.const 1)
          (then 
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)