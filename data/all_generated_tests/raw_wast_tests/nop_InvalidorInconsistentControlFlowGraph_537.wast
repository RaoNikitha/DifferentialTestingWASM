;; 8. Create a deeply nested structure of `loop` and `nop` instructions, testing how nested loop exit conditions are affected and ensuring control does not erroneously transfer to unintended parts of the CFG.

(assert_invalid
  (module
    (func $nested-loops
      (block
        (loop $loop1
          (nop)
          (loop $loop2
            (nop)
            (loop $loop3
              (nop)
            )
          )
        )
        (i32.const 0)
        (br_if 0)
      )
    )
  )
  "type mismatch"
)