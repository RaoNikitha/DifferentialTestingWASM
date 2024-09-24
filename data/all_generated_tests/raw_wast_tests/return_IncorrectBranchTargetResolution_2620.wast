;; 9. Test Description: Formulate a function that intentionally leaves the return context ambiguous by using br_unless within nested blocks before the return instruction. Ensure the return instruction resolves the correct outer block, which checks for correct target block resolution amidst ambiguous contexts.

(assert_invalid
 (module
  (func $return_with_br_unless (result i32)
   (block
    (loop
     (block
      (i32.const 0)
      (br_unless 0 (i32.const 1))
      (return (i32.const 2))
     )
    )
   )
  )
 )
 "type mismatch"
)