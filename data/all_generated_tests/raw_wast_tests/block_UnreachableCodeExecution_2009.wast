;; 10. Create a loop within a `block` and a branch that exits the loop to an `unreachable` instruction if the loop iterations affect the stack integrity and do not match the block's result type, verifying loop behavior nested within blocks.

(assert_invalid
 (module (func (result i32)
   (block (result i32)
     (loop
       (br 0 (i32.const 1))
     )
     (unreachable)
   )
 ))
 "type mismatch"
)