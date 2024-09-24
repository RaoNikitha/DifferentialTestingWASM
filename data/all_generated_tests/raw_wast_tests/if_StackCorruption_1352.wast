;; 3. **Test 3**: Implement nested `if` blocks where inner blocks modify the stack in such a way that the outer block's `else` branch causes a stack overflow. Ensure block types define specific operand counts to catch differences in stack management across implementations.

(assert_invalid
  (module
    (func $nested_if 
      (block (result i32)
        (i32.const 1)
        (if (result i32)
          (i32.const 1)
          (if (result i32)
            (i32.const 1)
            (then (i32.const 1))
          )
          (else (i32.add))
        )
        (i32.const 0)
      )
    )
  )
  "stack overflow due to nested if blocks"
)