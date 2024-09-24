;; 5. Test Description: Create a function that includes a deeply nested block structure with complex operand stacks, featuring a `br` instruction targeting an intermediary block. Analyze differential handling of `checkAndPopArgs` which might lead to stack inconsistencies in `wizard_engine`.

(assert_invalid
  (module
    (func $deep-nested-block (result i32)
      (block (result i32) 
        (block (result i32) 
          (block (result i32) 
            (i32.const 1)
            (br 1)
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)