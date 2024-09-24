;; 4. **Test Description**: Build a test where a loop calls a function updating a global state. The loop condition depends on this global state and includes a `br_if`. The function call deeply nested in another function must correctly alter the global state.    - **Constraint**: Validating global state changes through nested function calls and correct loop conditional branching.    - **Infinite Loop Relation**: Improper updating of global state via nested calls could fail the `br_if` condition, causing the loop to run endlessly.

(assert_invalid
 (module
  (global $state (mut i32) (i32.const 0))
  (func $updateState (result i32)
   (global.set $state (i32.add (global.get $state) (i32.const 1)))
   (global.get $state)
  )
  (func $nestedCall
   (call $updateState)
  )
  (func $loopingFunc
   (loop $loop
    (call $nestedCall)
    (br_if $loop (i32.lt_s (global.get $state) (i32.const 10)))
   )
  )
 )
 "type mismatch"
)