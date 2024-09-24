;; 2. **Test 2: Function Call with Multiple Return Values**    - Description: Call a function that returns multiple values, then use `br_table` to branch to different parts of the code. Verify if `br_table` correctly handles returning these values.    - Constraint Checked: Handling multiple return values from a function by `br_table`.    - Improper Function Call or Return Handling: Ensuring accurate return value management from functions within `br_table` branches.

(assert_invalid
  (module
    (func (result i32) (result i32)
      (block
        (block (result i32 i32)
          (br_table 0 1 (i32.const 0))
          (i32.const 1) (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)