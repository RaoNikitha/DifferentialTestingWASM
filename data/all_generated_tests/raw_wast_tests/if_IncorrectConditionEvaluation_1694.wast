;; 5. **Test Description**: Test an `if` block with a condition derived from a deeply nested set of instructions and data stack manipulations. This ensures the condition evaluation manages the operand stack correctly before deciding the branch.

(assert_invalid
 (module
  (func $deep-nesting-condition (result i32)
   (if (result i32)
    (i32.const 0)
    (then
     (if (result i32)
      (i32.const 1)
      (then (i32.const 42))
      (else (unreachable))
     )
    )
    (else (i32.const 84))
   )
  )
 )
 "type mismatch"
)