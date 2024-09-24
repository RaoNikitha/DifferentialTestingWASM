;; 6. **Test 6: Loop with Global State Modification in Imported Function**:    - A loop that calls an imported function which modifies a global variable, and uses the variable within the loop condition.    - **Constraint Checked**: Verifies that global state changes are correctly reflected within the loop control flow.    - **Relevance**: Ensures imported function calls correctly propagate global state changes back into the loop context.

(assert_invalid
 (module
  (global $g (mut i32) (i32.const 0))
  (import "env" "modify_global" (func $modify_global (result i32)))
  (func $test
   (loop $loop (result i32)
    (call $modify_global)
    (global.set $g (i32.const 1))
    (br_if $loop
     (i32.eq (global.get $g) (i32.const 0))
    )
   )
  )
 )
 "global state modification not reflected"
)