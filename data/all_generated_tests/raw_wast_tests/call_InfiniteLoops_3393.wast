;; 2. **Test Description**: Design a loop that includes a function call modifying a local variable used in the loop condition. The called function includes another nested call and uses `br` to break the outer loop under specific conditions.    - **Constraint**: Correctly propagating the effects of nested function calls and breaking loops accurately.    - **Infinite Loop Relation**: Incorrectly handled nested calls or `br` condition can prevent the loop from breaking, resulting in an infinite loop.

(assert_invalid
  (module
    (func $nested-call-modify-local
      (local $cond i32)
      (local.set $cond (i32.const 1))
      (loop $outer
        (call $modify-condition)
        (br_if $outer (local.get $cond))
      )
    )
    (func $modify-condition
      (call $nested-function)
      (if (i32.eqz (i32.const 0))
        (then (local.set $cond (i32.const 0)))
      )
    )
    (func $nested-function
      (br 0)
    )
  )
  "invalid conditional break"
)