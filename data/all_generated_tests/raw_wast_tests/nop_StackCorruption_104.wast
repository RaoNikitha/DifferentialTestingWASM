;; 5. Construct a recursive function that uses multiple `nop` instructions between recursive calls. Check the stack for signs of corruption due to improper handling of the `nop` instructions during recursion.

(assert_invalid
  (module 
    (func $recursive-nop (param i32) 
      (if (i32.eqz (local.get 0)) 
        (return) 
      ) 
      (nop) 
      (nop) 
      (call $recursive-nop (i32.sub (local.get 0) (i32.const 1))) 
    )
  )
  "unexpected end of module"
)