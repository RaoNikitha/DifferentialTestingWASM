;; 10. **Back-and-Forth Branching:**    Write a sequence where branches repeatedly move execution back and forth between deeply nested blocks and loops, ensuring operand stacks are consistently managed. This stress-tests the stack integrity during rapid context switching and label targeting.

(assert_invalid
  (module
    (func $back_and_forth_branching
      (block (result i32) 
        (i32.const 0)
        (block (result i32) 
          (loop (result i32) 
            (block 
              (br 0)
            )
            (block
              (br 1)
            )
            (br_if 0 (i32.const 1))
          )
        )
        (i32.add)
      )
    )
  )
  "type mismatch"
)