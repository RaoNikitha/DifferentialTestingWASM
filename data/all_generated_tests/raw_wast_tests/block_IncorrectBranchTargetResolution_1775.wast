;; 6. **Label Shifting**:    Test blocks where new labels are introduced multiple times consecutively, ensuring the correct shifting of label indices and that branches reference the intended targets even with complex label stacks.

(assert_invalid
  (module (func $label-shift-test
    (block (result i32) 
      (block (result i32) 
        (br 2 (i32.const 42))
      )
      (i32.const 0)
    )
  ))
  "invalid branch depth"
)