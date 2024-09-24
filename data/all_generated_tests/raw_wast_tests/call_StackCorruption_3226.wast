;; 5. Create a function that recursively calls itself with conditional arguments. Validate that each recursive call handles the stack depth properly, preventing any overflow or corruption.

(assert_invalid 
  (module 
    (func $recursive (param i32) (result i32) 
      (local.get 0) 
      (i32.const 1) 
      (i32.gt_s) 
      (if (result i32)
        (then
          (local.get 0) 
          (i32.const 1) 
          (i32.sub) 
          (call $recursive)
        )
        (else
          (local.get 0)
        )
      )
    ) 
    (func $main (result i32) 
      (i32.const 10)
      (call $recursive)
    ) 
  ) 
  "type mismatch"
)