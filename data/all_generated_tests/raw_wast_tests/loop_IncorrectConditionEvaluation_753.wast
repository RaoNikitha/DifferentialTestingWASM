;; 4. Set up a loop where the `br_if` condition involves a stack operation that pushes and pops values. Intentionally modify stack values in each iteration to see if the loop exits at the correct condition. This tests condition evaluation in conjunction with stack manipulation.

(assert_invalid
  (module 
    (func (result i32)
      (local i32)
      i32.const 10
      loop (result i32)
        (local.get 0)
        (i32.const 1)
        (i32.sub)
        (local.set 0)
        (local.get 0)
        (br_if 0)
      end
    )
  )
  "type mismatch"
)