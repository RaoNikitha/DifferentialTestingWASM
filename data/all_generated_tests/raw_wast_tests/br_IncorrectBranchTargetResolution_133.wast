;; 4. **Misaligned Forward Branch:**    Create a `block` with an inner `if` and use `br` to forward branch to a non-existent or wrongly indexed label within the `block` boundary. Make sure to capture any label resolution errors.

(assert_invalid
 (module 
   (func (block 
     (if 
       (then 
         (br 1) 
       )
     )
   ))
 )
 "unknown label"
)