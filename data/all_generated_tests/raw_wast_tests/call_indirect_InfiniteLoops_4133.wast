;; 2. **Test 2**:     - Test calling an indirect function with a valid table index and function type but include a nested loop within the called function. Ensure the inner loop improperly uses `br_if` to skip breaking conditions, which may lead to infinite looping.    - **Constraint Checked**: Tests the handling of nested loop control flow and indirect function invocation’s stack operations.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $func))
    (func $nested_loop_func (param i32) (result i32)
      (loop $outer
        (call_indirect (type $sig) (local.get 0) (i32.const 0))
        (loop $inner
          (br_if $outer (i32.const 1))
        )
      )
      (i32.const 0)
    )
    (func (result i32)
      (call_indirect (type $sig) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)