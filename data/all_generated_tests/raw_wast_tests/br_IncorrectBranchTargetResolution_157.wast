;; 8. **Test Description:**    Build a program with several nested loops followed by `if` statements where a `br` targets a label belonging to a terminating outer loop, testing from deeply nested positions. This scenario ensures that the branch instruction does not incorrectly resolve the target and adheres strictly to the valid label scope rules.

(assert_invalid
  (module
    (func $nested-loops-if
      (loop $loop1
        (loop $loop2
          (loop $loop3
            (block $b1
              (block $b2
                (br 3)
              )
            )
          )
        )
      )
    )
  )
  "undefined label"
)