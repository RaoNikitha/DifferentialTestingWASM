;; 8. **Test 8: Loop Block Containing Unreachable Instruction**    - **Description**: Design a `loop` block with an internal `unreachable` instruction and ensure that loop-related control flow does not trigger the `unreachable` wrongly.    - **Constraint**: Tests correct handling of unreachables inside loops to avoid incorrect re-entry.

(assert_invalid
 (module
   (func $test_loop_unreachable
     (loop (result i32)
       (unreachable)
       (br 0 (i32.const 42))
     )
   )
 )
 "type mismatch"
)