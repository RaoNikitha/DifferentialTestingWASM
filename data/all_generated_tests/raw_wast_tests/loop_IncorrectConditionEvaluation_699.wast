;; Test a `loop` containing a conditional exit using `br_if` based on stack values modified within the loop body. Ensure a value inequality condition like `3 > 5` doesn't trigger the branch, maintaining the loop intact.

(assert_invalid
  (module (func $conditional-exit-loop
    (loop $l (result i32)
      (i32.const 5) (i32.const 3) 
      (i32.gt_s)
      (br_if $l)
      (i32.const 1)
    )
  ))
  "type mismatch"
)