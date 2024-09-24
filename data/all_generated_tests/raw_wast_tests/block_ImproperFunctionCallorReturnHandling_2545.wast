;; 6. **Returning from Function Called within Block:**    - **Test Description:** Create a block where a function is called, which itself contains a `return` instruction, to check correct return behavior.    - **Constraint Checked:** Proper handling of nested function returns and context management.    - **Relation to Improper Function Handling:** Ensure that returns within called functions are handled correctly from within a block context.

(assert_invalid
  (module (func $return-in-block
    (block
      (call 0)
    ))
    (func $test-return
      (return)
    )
  ))
  "invalid type in block"