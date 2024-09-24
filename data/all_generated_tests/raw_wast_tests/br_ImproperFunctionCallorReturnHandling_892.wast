;; 3. **Incorrect Return due to Outward Branch:**    - Description: Create a function that defines multiple nested blocks, with a `br` branching out from an inner block to an outer block just before a return statement. Validate that the function returns the correct value.    - Constraint: This checks if the `br` properly unwinds the operand stack and manages return values when branching outward.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br 2)
            (i32.const 1)
          )
          (i32.const 2)
        )
        (i32.const 3)
      )
      (return (i32.const 4))
    )
  )
  "type mismatch"
)