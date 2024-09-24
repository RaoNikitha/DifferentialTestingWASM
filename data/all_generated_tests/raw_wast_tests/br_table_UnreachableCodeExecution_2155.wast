;; 5. **Test Description**: A loop with a `br_table` inside where the operand targets a label that causes the program to reach an `unreachable` instruction due to incorrect operand stack depth, testing for error handling in loop-based instruction flows.

(assert_invalid
 (module
  (func (param i32)
   (block
    (loop
     (br_table 0 1 2 (i32.const 3) (unreachable))
    )
   )
  )
 )
 "type mismatch"
)