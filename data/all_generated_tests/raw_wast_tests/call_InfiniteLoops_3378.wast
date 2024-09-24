;; 7. **Nested Calls within Loop with Early Exit**:    - **Description**: Design a loop that contains nested function calls with an intended early exit using `br_if`. Ensure the early exit condition is evaluated in the deepest function.    - **Reason**: This checks proper loop exit handling via nested `br_if-`based calls. Failure in condition evaluation may cause the loop to continue indefinitely.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.gt_s
      if (result i32)
        i32.const 1
      else
        i32.const 0
      end
    )
    (func $test (result i32)
      i32.const 5
      loop (result i32)
        call $f
        br_if 1
        drop
        i32.const 0
      end
    )
  )
  "type mismatch"
)