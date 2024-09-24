;; 10. Create a loop that includes instructions to manipulate the stack, followed by `br` and `br_if` instructions targeting the loop itself. Ensure that branches correctly resolve and maintain the stack's integrity after branching, testing proper context and label management in the presence of stack operations.

(assert_invalid
  (module
    (func $loop-stack-manipulation
      (loop (result i32)
        (i32.const 1)   ;; Push 1 onto the stack
        (i32.const 2)   ;; Push 2 onto the stack
        (i32.add)       ;; Add the top two values (1 + 2 = 3)
        (br 0)          ;; Branch back to the beginning of the loop
        (i32.const 4)   ;; Unreachable instruction
      )
      (drop)            ;; Drop the result
    )
  )
  "type mismatch"
)