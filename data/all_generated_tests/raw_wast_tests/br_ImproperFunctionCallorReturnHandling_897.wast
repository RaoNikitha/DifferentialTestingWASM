;; 8. **Indirect Function Call with Branch inside Loop:**    - Description: Define a function that calls another function indirectly within a loop, and use a `br` to branch out of the loop back to the calling function. Check that the function returns correctly.    - Constraint: The test verifies that `br` correctly handles indirect calls within loops and ensures the correct return value from the function.

(assert_invalid
  (module
    (type $t0 (func))
    (type $t1 (func (param i32) (result i32)))
    (import "" "" (func $f (type $t1)))
    (table funcref (elem $f))
    (func $caller 
      (local i32)
      (loop (local.set 0 (call_indirect (type $t1) (i32.const 0) (i32.const 42)) (br 1))
    )
    (local.get 0)
    )
  )
  "type mismatch"
)