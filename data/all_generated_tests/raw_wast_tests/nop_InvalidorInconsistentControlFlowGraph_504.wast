;; 5. **Test 5: `nop` at Function Entry and Exit**    - **Constraint Check**: Check if `nop` at the beginning and end of functions influences the entry and exit flow.    - **Description**: Place `nop` instructions at the start and end of a function and validate that the function entry and exit routines work as expected.

(assert_invalid
  (module (func $test-func (nop) (block) (nop)))
  "block type mismatch"
)