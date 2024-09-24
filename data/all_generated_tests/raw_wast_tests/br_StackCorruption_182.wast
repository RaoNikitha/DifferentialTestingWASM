;; 3. Design a test where the `br` instruction targets a label that is just beyond a boundary check (e.g., depth is just below `ctl_stack.top`). Confirm that the stack remains consistent and unwinding does not cause an underflow.

(assert_invalid
  (module
    (func
      (block
        (block
          (br 2)
        )
      )
    )
  )
  "unknown label"
)