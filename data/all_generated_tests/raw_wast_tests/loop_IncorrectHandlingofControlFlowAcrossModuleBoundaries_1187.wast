;; 8. **Test 8: Conditional Loop with External Function Branching**:    - A loop structure that conditionally calls imported functions, which in turn perform looping logic.    - **Constraint Checked**: Ensures control flow logic correctly transitions between looping contexts of the main loop and the called function.    - **Relevance**: Tests proper handling of control transitions between nested looping constructs in different modules.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $conditionalLoop
      (local $x i32)
      (local $y i32)
      (loop $loop_label (result i32)
        (call $external_func)
        (local.tee $x)
        (local.get $y)
        (i32.add)
        (i32.const 10)
        (i32.eq)
        (br_if $loop_label)
      )
    )
  )
  "type mismatch"
)