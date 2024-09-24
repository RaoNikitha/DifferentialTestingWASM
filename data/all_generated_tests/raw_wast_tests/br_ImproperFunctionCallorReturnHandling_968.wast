;; 9. **Branch within Function Call Chain:**    Test branching out of a sequence of function calls using `br` instructions targeting various points in the hierarchy. Verify correct control flow and operand stack states are retained across multiple calls.

(assert_invalid 
  (module
    (func $branch_within_function_call (param i32) (result i32)
      (block $outer
        (block $inner
          (br 1 (call $helper (local.get 0)))
        )
        (return (i32.const 42))
      )
    )
    (func $helper (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
  )
  "type mismatch"
)