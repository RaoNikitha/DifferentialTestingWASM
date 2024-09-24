;; Test 3: Create a function with nested blocks where multiple `return` instructions are placed in different blocks, but only one should execute depending on a conditional block at the beginning of the function. Verify that `return` correctly exits all nested blocks and returns the correct value.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (block 
            (return (i32.const 42))
          )
        )
        (else
          (return (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)