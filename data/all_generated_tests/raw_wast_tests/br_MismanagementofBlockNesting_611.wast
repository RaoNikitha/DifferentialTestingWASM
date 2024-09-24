;; 2. **Test with Nested Loops and Conditional Branches:**    Construct nested `loop` and `if` structures with `br` instructions targeting different levels of nesting. This will verify if the implementation correctly interprets branching within nested loops and conditionals.

(assert_invalid
  (module
    (func $nested-loops-and-conditionals
      (block
        (loop
          (loop
            (i32.const 0)
            (if (then (br 2)))
          )
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)