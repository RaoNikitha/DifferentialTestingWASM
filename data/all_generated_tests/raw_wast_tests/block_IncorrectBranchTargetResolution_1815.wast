;; 6. **Test Description**: Define a block containing an inner block, both performing arithmetic operations and manipulating the stack. Use `br_if` to conditionally jump from the inner block to label 0, ensuring the correct interpretation of the label within the nested structure.

(assert_invalid
  (module (func $nested-blocks-arithmetic
    (block (result i32)
      (i32.const 4) 
      (i32.const 3)
      (block (result i32)
        (i32.add)
        (br_if 0 (i32.const 1))
      )
      (i32.sub)
    )
  ))
  "type mismatch"
)