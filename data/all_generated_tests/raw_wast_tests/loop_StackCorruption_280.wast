;; 1. Test a `loop` with complex nested control structures and multiple `br` instructions that target different loops. Validate that the stack correctly unwinds and re-winds for each `br` command, ensuring no stack corruption.

(assert_invalid
  (module (func $complex-loop
    (block
      (loop 
        (block 
          (br 2)
        )
        (br 1)
      )
      (loop 
        (block 
          (br 2)
        )
      )
    )
  ))
  "type mismatch"
)