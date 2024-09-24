;; 2. Generate an `if` block with a condition that accesses labels outside its scope, essentially breaking nesting and context rules which must result in validation errors.

(assert_invalid
 (module
  (func $label-scope-misuse
   (block
    (if (result i32) 
     (i32.const 1) 
     (then 
      (block 
       (br 2))) 
     (else 
      (i32.const 0)))
   )
  )
 )
 "unknown label"
)