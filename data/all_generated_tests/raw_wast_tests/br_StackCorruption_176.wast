;; 7. **Test Description:**    - Construct a function that includes nested loops with branches (`br` instructions) per loop iteration targeting different outer blocks. Ensure that the operand stacks are managed correctly each iteration without any corruption by checking the before and after states of the operand stack.

(assert_invalid
  (module
    (func $nested-loops-with-branches
      (block (loop (result i32)
        (i32.const 1) (br 1)
      ))
      (block (result i32)
        (i32.const 2) (br 1) (i32.const 3)
      )
    )
  )
  "type mismatch"
)