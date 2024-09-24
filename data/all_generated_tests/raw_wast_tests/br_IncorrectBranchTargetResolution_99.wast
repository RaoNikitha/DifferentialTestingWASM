;; 10. **Mixed Control Structure Branch Test**: Create a mixed structure of blocks, loops, and conditionals, and misreferencing them through a `br` instruction. Verify that the branch correctly interprets the relative indexing into the intended valid target control structure, ensuring no unexpected jumps.

(assert_invalid
  (module
    (func $mixed-control-branch
      (block $outer
        (loop $middle
          (block $inner
            (i32.const 1) (i32.const 2)
            (if (result i32) 
              (then (br $outer))
              (else (br $middle))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)