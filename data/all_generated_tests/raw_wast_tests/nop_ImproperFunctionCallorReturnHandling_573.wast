;; 4. **Test Description**: Construct a function with a `loop` containing `nop` instructions and a `call` to another function that breaks the loop using a conditional return. Validate if the loop and the function return the expected values consistently.    - **Constraint Checked**: Ensures loop and call integration.    - **Relation to Improper Handling**: Incorrect `nop` behavior may disrupt loop control and function returns.

(assert_invalid
  (module
    (func $break-loop (result i32)
      (loop $l1
        (nop)
        (call $inner-func)
        (br_if $l1 (i32.eqz (i32.const 0)))
        (return (i32.const 1))
      )
      (i32.const 0)
    )
    (func $inner-func (nop))
  )
)