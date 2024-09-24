;; 5. **Test Description**: Establish a test where a `br_if` targets a label indexed deep within the control structure. The target label should expect a specific stack height. Validate that improper implementation leaves erroneous excess stack items.   - **Constraint Being Checked**: Validating the stack height is correctly maintained.   - **Stack Corruption Aspect**: Mismanagement of stack height during branch operations can lead to excess or missing stack values, causing execution errors.

(assert_invalid
  (module
    (func $deep-label-check 
      (block
        (block
          (block
            (block
              (block
                (i32.const 0) 
                (br_if 4 (i32.const 1)) 
              ) 
            ) 
          ) 
        ) 
      )
    )
  )
  "unknown label"
)