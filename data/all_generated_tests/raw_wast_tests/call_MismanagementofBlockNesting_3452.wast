;; 1. **Check Unbalanced Block Nesting with Function Calls**:    - **Test Description**: Create a function that contains nested blocks with calls to other functions at different nesting levels. The function at the deepest nesting level should modify a global variable. This test checks the correct management of the operand stack and the handling of return addresses in nested blocks.    - **Constraint Checked**: Proper argument transfer and checking in deeply nested blocks.    - **Relation to Mismanagement of Block Nesting**: Ensures the call instruction correctly handles return flows even within deeply nested blocks.

(assert_invalid
  (module
    (global $glob (mut i32) (i32.const 0))
    (func $modify_global (global.set $glob (i32.const 10)))
    (func $nested_call
      (block
        (block
          (block
            (call $modify_global)
          )
        )
      )
    )
  )
  "unbalanced block nesting"
)