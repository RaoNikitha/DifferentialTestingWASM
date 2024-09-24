;; 3. **Test: Function Call Within Nested Loop Structure**     - Description: Implement a nested loop within an outer loop, where the inner loop includes a `call` to a function that performs a modification of a global variable. Ensure the function call respects loop nesting and the correct function is called.     - Constraint: Checks for correct handling of nested loop context and valid function call stack management.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify_global (result i32)
      global.get $g
      i32.const 1
      i32.add
      global.set $g
      global.get $g
    )
    (func $nested_loops
      (loop (result i32)
        (block (result i32)
          (loop (result i32)
            call $modify_global
            br 1
          )
        )
      )
    )
  )
  "type mismatch"
)