;; 2. **Test 2: `unreachable` After Conditional Operations**    - Test features an `unreachable` instruction after a conditional operation (e.g., `if` statement).    - Ensures that the stack remains intact and there are no lingering operations pushing/popping values incorrectly post-trap.    - Validates proper stack cleanup even when used after conditional logic.

(assert_invalid
 (module
  (func $type-if-unreachable (result i32)
   (if (then (i32.const 42) (unreachable)))
   (i32.const 0)
  )
 )
 "type mismatch"
)