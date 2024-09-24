;; 7. **Test Description:**    - Create a module that exports a function with multiple branching points using `br` instructions, each targeting different label depths.    - Import and call this function, verifying that each `br` instruction correctly handles the operand stack and label resolution.    - **Constraint:** Confirm robust handling of multiple label depths and operand stack consistency across module boundaries.

(assert_invalid
  (module 
    (func $multiple_branches
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 1)
            (br 2)
          )
          (i32.const 2)
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)