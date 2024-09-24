;; 5. Create a loop containing an `if` statement where the loop's termination condition is inside improperly nested `if` leading to CFG inconsistencies. Ensures proper handling of control flow in nested structures.

(assert_invalid
 (module (func $loop-if-invalid-nesting
   (loop (result i32)
     (i32.const 1)
     (if (result i32)
       (then
         (i32.const 2)
         (br 1)  ;; Break out of loop
       )
       (else
         (loop (result i32)
           (if (result i32) (i32.const 3) (then) (else (br 1)))
         )
       )
     )
   )
 ))
 "type mismatch"
)