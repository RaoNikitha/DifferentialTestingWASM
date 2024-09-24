;; - **Test 5: Multiple Conditional Branches in Sequence**   ```   Test a sequence of conditional branches (`br_if`) leading to an `unreachable` instruction. Misinterpretation in condition handling should show discrepancies in the execution reaching the unreachable, causing differential trap behavior.   ``` -

(assert_invalid
 (module
  (func $multiple_conditional_branches
   (i32.const 1)
   (br_if 0)
   (unreachable)
   (i32.const 2)
   (br_if 0)
   (f32.const 0)
  )
 )
 "type mismatch"
)