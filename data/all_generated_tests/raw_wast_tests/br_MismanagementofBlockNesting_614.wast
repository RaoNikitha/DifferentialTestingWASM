;; 5. **Test with Backward Branching in Deep Loops:**    Set up deeply nested `loop` structures and use `br` instructions to branch backward to the start of the loops. This checks that backward branching correctly jumps to the beginning of the intended loop construct.

(assert_invalid
  (module
    (func
      (block
        (loop
          (loop
            (br 2)
            (nop)
          )
          (nop)
        )
      )
    )
  )
  "type mismatch"
)