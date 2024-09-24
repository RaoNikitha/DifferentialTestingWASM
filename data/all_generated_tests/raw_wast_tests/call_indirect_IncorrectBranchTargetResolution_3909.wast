;; 8. **Test Case 8**:    - **Description**: Create a module where `call_indirect` is executed in a nested loop. The depth is critical to test where `br_unless` should exit the most inner loop. Ensure the function called is correct respective to depths handled by the conditional break.    - **Constraint Checked**: Proper conditional break handling within loops.    - **Incorrect Branch Target Resolution**: Verifies that `br_unless` does not improperly resolve labels due to misaligned depth contexts.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (func $nested-loop
      (local $i i32)
      (local $j i32)
      (loop $outer
        (loop $inner
          (i32.const 0)
          (call_indirect (type $sig) (i32.const 0))
          (local.get $i)
          (i32.const 1)
          (i32.add)
          (local.set $i)
          (local.get $i)
          (i32.const 10)
          (i32.eq)
          (br_if $outer)
        )
        (local.get $j)
        (i32.const 1)
        (i32.add)
        (local.set $j)
        (local.get $j)
        (i32.const 5)
        (i32.eq)
        (br_if $inner)
      )
    )
    (table funcref (elem 0 (ref.func $nested-loop)))
    (func (export "test"))
  )
  "invalid call_indirect type"
)