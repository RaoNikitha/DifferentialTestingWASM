;; 3. **Test Description**: Implement an `if` block where the condition involves a complex expression (e.g., arithmetic operations). The output should validate that the condition is evaluated equivalently across implementations and the correct branch is taken.

(assert_invalid
  (module 
    (func $complex-condition (result i32)
      (if (result i32)
        (i32.gt_s 
          (i32.add (i32.const 5) (i32.const -3))
          (i32.mul (i32.const 2) (i32.const 1))
        )
        (then (i32.const 42))
        (else (i32.const 24))
      )
    )
  )
  "type mismatch"
)