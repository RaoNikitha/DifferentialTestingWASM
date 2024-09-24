;; 4. Design a test with multiple `loop` statements, and a `br` that should exit to the middle of the nested loops, followed by `return`. Check if wrong stack unwinding leads to infinite loops.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 0)
      (loop
        (br 1)
        (block
          (loop
            (return)
            (br 0)
          )
        )
      )
    )
  )
  "type mismatch"
)