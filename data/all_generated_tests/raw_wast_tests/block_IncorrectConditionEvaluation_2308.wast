;; 9. A `block` containing a computation of condition values (like comparison operations) before using them in `br_if` instructions, checking for mistakes in the condition logic affecting branches.

(assert_invalid
  (module (func $comp-branch-condition (result i32)
    (block (result i32)
      (i32.const 5)
      (i32.const 10)
      (i32.lt_s) 
      (br_if 0)
      (i32.const 3)
    )
  ))
  "type mismatch"
)