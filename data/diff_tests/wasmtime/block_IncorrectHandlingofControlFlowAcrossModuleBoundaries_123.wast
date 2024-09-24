;; 4. Create a `block` in the main module that calls an imported function which does not return. Verify that no extraneous values are left on the operand stack after the block executes.

(assert_invalid
  (module
    (import "env" "non_returning_function" (func $non_returning_function))
    (func (result i32)
      (block (result i32)
        call $non_returning_function
        i32.const 1
      )
    )
  )
  "type mismatch"
)