;; 4. Test a `br_table` within a loop structure where target labels and the default label involve `return` instructions. Ensure that the function returns correctly and the control flow unwinds as expected without trapping.

(assert_invalid
  (module 
    (func (result i32)
      (block $exit (result i32)
        (loop $loop (result i32)
          (br_table $loop $exit $exit (i32.const 0))
          (return (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)