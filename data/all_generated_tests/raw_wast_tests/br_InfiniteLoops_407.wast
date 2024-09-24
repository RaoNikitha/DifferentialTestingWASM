;; 8. Design a test with a transitory `block` within a `loop` where a `br` instruction is meant to exit both but verify the execution resumes after both `end` instructions. Incorrect branch behavior here can lead to loop continuation causing infinite loops.

(assert_malformed
 (module
  (func (loop (block (br 1)) (br 0)))
 )
 "type mismatch"
)