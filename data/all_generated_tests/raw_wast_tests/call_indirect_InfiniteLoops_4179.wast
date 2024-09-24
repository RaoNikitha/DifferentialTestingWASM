;; 8. **Test Description**: Construct a test where `call_indirect` is used to dynamically select and execute test functions that internally perform their own loop operations, nested within an external loop. Each function should signal for the outer loop to break, but incorrect operand handling causes it not to.    - **Constraint Being Checked**: Accuracy and consistency in handling nested loop structures within indirect calls.    - **Relation to Infinite Loops**: Failure to break from the outer loop due to internal loop conditions not propagating correctly, causing infinite loop.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table funcref (elem $loop_fn1 $loop_fn2))
    (func $loop_fn1 (param i32)
      (loop $outer
        (loop $inner
          (call_indirect (type $sig) (local.get 0))
          (br_if $inner (i32.const 0))
        )
        ;; signal to break the outer loop
        (br_if $outer (i32.const 1))
      )
    )
    (func $loop_fn2 (param i32)
      (loop $outer
        (loop $inner
          (call_indirect (type $sig) (local.get 0))
          (br_if $inner (i32.const 1))
        )
        ;; signal to break the outer loop
        (br_if $outer (i32.const 1))
      )
    )
    (func (param i32)
      (call_indirect (type $sig) (local.get 0))
    )
  )
  "type mismatch"
)