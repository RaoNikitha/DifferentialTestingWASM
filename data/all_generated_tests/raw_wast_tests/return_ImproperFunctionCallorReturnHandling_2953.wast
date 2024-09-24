;; 2. Test a function with nested blocks and different return paths:    - Create a function with several nested blocks and conditional branches, each ending with a `return`.    - Verify if the function returns the correct value for each path and cleans up the stack appropriately.

(assert_invalid
  (module
    (func (result i32)
      (local i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 0)
            (br_if 2 (i32.const 1))  ;; Jump to outer block
            (i32.const 2)
            (return)
          )
          (i32.const 3)
          (return)
        )
        (i32.const 4)
        (return)
      )
    )
  )
  "type mismatch"
)