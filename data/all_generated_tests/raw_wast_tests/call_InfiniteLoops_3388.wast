;; 7. **Branched Loop with Conditional Argument Passing**: Construct a loop with a conditional branch (`br_if`) where arguments are only sometimes pushed to the stack before a function call. This tests handling of conditionally branched argument transfers within loops.

(assert_invalid
  (module
    (func $loop_with_branch (param i32) (param f64)
      (loop (param i32 f64)
        (br_if 0 (i32.eqz (local.get 0))
          (call $func_with_two_params (local.get 0) (local.get 1))
          (local.set 0 (i32.sub (local.get 0) (i32.const 1)))
        )
      )
    )
    (func $func_with_two_params (param i32) (param f64))
  )
  "type mismatch"
)