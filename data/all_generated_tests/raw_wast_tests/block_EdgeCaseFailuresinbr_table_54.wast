;; - **Test 5**: Create a `block` with `br_table` that utilizes an index corresponding to a valid label but with an excessive jump count. Check if `wizard_engine` properly maintains the `ctl_stack` and adapts the excessive jump logic correctly, contrasting WebAssembly's nested context handling.

(assert_invalid
  (module 
    (func $test-br_table-excessive-jump 
      (block (result i32) 
        (block (result i32) 
          (br_table 0 0 1 (i32.const 1)) 
        ) 
        (i32.const 2) 
      ) 
    )
  )
  "type mismatch"
)