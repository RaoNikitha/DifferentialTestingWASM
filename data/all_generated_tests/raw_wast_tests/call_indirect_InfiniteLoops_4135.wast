;; 4. **Test 4**:     - Invoke a function indirectly where the loop iteration condition directly depends on the function's parameter. Misconfigure the `br_if` condition, leading to infinite recursion and looping.    - **Constraint Checked**: Ensures proper operand stack handling and correct evaluation of loop exit conditions correlated with function parameters.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem 1))
    (func $f (param i32) (result i32)
      (loop
        (br_if 0 (local.get 0))
        (call_indirect (type $sig) (local.get 0))
      )
    )
  )
  "type mismatch"
)