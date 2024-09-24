;; 4. **Test Description:** Create a `block` with a nested `block`. Use `br_if` to conditionally break from the inner block to the outer one. Place an `unreachable` in the case where the `br_if` condition is false to test if the correct block is branched out of, ensuring overwritten stack states don't lead to unexpected execution of the `unreachable`.

(assert_invalid
 (module
   (func
     (block
       (block 
         (br_if 1 (i32.const 1))
         (unreachable)
       )
     )
   )
 )
 "type mismatch"
)