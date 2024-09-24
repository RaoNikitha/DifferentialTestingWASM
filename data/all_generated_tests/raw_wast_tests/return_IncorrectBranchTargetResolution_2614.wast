;; 3. Test Description: Write a function with several nested conditional blocks and utilize the return instruction within different branches. Ensure the correct conditional branch is executed, and the control returns from the function appropriately. This test assesses if the return instruction accurately resolves the correct branch under different conditions.

(assert_invalid
  (module
    (func $nested-conditional-return (result i32)
      (i32.const 1)
      (if (result i32)
        (then 
          (i32.const 1)
          (if (result i32) 
            (then (i32.const 2))
            (else (return))
          )
        )
        (else (return))
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)