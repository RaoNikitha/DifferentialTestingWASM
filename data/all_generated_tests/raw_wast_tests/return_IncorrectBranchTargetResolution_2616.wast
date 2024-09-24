;; 5. Test Description: Design a function with nested loops having similar label identifiers. Insert a return instruction inside the loop and check if it correctly returns from the outermost function instead of an intermediate loop. This will test for incorrect branch target resolution due to label misinterpretation.

(assert_invalid
  (module
    (func $nested-loops-label-conflict (result i32)
      (loop 
        (loop 
          (return) 
        ) 
        (i32.const 0)
      )
    )
  )
  "stack type mismatch"
)