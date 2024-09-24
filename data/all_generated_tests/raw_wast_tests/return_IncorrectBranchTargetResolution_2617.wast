;; 6. Test Description: Create a function comprised of consecutive nested blocks. Apply the return instruction to ensure it unwinds the stack properly and targets the correct block as per function scope. This verifies that the return instruction recognizes the correct outermost block.

(assert_invalid
  (module
    (func $nested-blocks (result i32)
      (block
        (block
          (block
            (return (i32.const 42))
          )
        )
        i32.const 0
      )
    )
  )
  "type mismatch"
)