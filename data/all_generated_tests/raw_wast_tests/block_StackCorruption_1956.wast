;; 7. **Forward Branch with Mismatched Stack Frames**: Create a series of forward branches (`br`) within a block to a different block that ends with a different stack frame, ensuring that blocks properly reset state even when jumped from within a nested environment.

(assert_invalid
  (module 
    (func $forward-branch-mismatched-stack (result i32)
      (block (result i32)
        (block (br 1 (i32.const 1)) (i32.const 2))
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)