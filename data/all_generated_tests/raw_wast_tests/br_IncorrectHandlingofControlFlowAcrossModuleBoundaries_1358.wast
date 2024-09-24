;; 9. **Test Description:**    - **Test Name:** Backward Branch to Loop in Exported Function Test    - **Objective:** Test if backward branches targeting loops within exported functions are correctly executed.    - **Constraint:** Validates proper backward jumps within the structured control flow of exported functions.    - **Relation to Incorrect Handling:** Ensures backward branches maintain correct program state and execution flow across module export boundaries.

(assert_invalid
  (module 
    (func (export "test_func")
      (block 
        (loop 
          (br 1) 
        ) 
      ) 
    )
  )
  "invalid branch"
)