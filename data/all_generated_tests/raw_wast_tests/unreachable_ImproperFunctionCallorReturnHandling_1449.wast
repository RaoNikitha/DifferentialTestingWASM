;; 10. **Test Description:**     Test a function with `unreachable` placed inside an inline `block`, followed by a `return` outside the block structure. Verify if the block trap prevents return from the function itself.    **Constraint Checked:** Correct execution and trapping within block and subsequent function return.    **Relation to Improper Call/Return Handling:** Ensures function-level trapping from `unreachable` inside nested blocks is correctly handled, preventing improper return actions.

(assert_invalid
  (module (func $test_function 
    (block 
      unreachable
    ) 
    return
  ))
  "unexpected return due to unreachable in block"
)