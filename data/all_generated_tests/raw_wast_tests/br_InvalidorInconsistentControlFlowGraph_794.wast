;; Construct a series of nested `loop` instructions with varying depths and use `br` to simulate a `continue` operation to the nearest enclosing loop. Check for correct jump and operand management. Testing for: Properly managing backward jumps to loops and ensuring operand stack consistency in nested loop hierarchies.

(assert_invalid
  (module
    (func $nested-loops
      (loop $outer-loop
        (loop $inner-loop
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)