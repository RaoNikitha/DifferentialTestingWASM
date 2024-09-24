;; 7. Generate an `if` block where the condition depends on the result of a previous complex computation to test the CFG's handling of condition evaluation and subsequent control flow branching.

(assert_invalid
  (module
    (func $complex-if (param i32) (result i32)
      (local i32)
      (local.set 1 (i32.mul (local.get 0) (local.get 0)))
      (if (result i32)
        (i32.eq (local.get 1) (i32.const 0))
        (then (i32.const 42))
        (else (i32.const 24))
      )
    )
  )
  "type mismatch"
)