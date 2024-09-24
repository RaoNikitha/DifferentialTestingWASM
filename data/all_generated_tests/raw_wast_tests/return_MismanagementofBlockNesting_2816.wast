;; 5. **Complex Block with Multiple Returns**: Create a function where multiple nested blocks contain their own `return` instructions within various levels of nested loops. This test examines whether each `return` correctly unwinds to its respective outermost block and the potential for incorrect block targeting.

(assert_invalid
  (module
    (func $complex-nested-blocks-multiple-returns (result i32)
      (block $outer
        (block $inner
          (loop $loop1
            (br $inner (return (i32.const 1)))
          )
          (return (i32.const 2))
        )
        (return (i32.const 3))
      )
      (return (i32.const 4))
    )
  )
  "type mismatch"
)