;; 8. Write a function where `br_if` based on a memory load determines whether a `return` is immediately hit. Compare if memory condition is incorrectly handled, leading to divergent return paths.

(assert_invalid
  (module
    (memory 1)
    (func (result i32)
      (i32.load (i32.const 0))
      (br_if 0 
        (return (i32.const 1))
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)