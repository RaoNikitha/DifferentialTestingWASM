;; 8. Develop a case where a `loop` is within another `loop`, followed by `br_if` and `return`. Ensure return correctly exits both loops; wrong exits causing infinite nested loops.

(assert_invalid
  (module
    (func $nested-loop-br_if-return (result i32)
      (i32.const 0)
      (loop 
        (loop 
          (br_if 0 (return (i32.const 1)))
        )
      )
    )
  )
  "type mismatch"
)