;; 7. Test Description: Design a function containing a sequence of `call` instructions interspersed with `br` instructions targeting various nested blocks. Place various types on the stack before operation, testing for propagation of stack corruption due to inadequate `popE` handling in `wizard_engine`.

(assert_invalid
  (module
    (func $test
      (call $dummy_func)
      (block
        (i32.const 0) (br 0)
        (call $dummy_func)
      )
      (block (result i32)
        (i32.const 1) (br 0) (call $dummy_func)
      )
      (block
        (block (result i32) 
          (i32.const 2) (br 0) 
          (call $dummy_func)
        )
        (i32.const 3) 
        (br 1) 
      )
    )
  )
  "type mismatch"
)