;; Test a sequence of function calls designed to push the stack to its maximum limit, then make additional calls that should cause stack overflow. This identifies how each implementation handles stack capacity limits and overflow scenarios.

(assert_invalid
  (module
    (func $max-stack-depth
      (call 1) (call 1) (call 1) (call 1) (call 1)
      (call 1) (call 1) (call 1) (call 1) (call 1)
      (call 1) (call 1) (call 1) (call 1) (call 1)
      (call 1) (call 1) (call 1) (call 1) (call 1)
      (call 1) (call 1) (call 1) (call 1) (call 1)
      (call 1) (call 1) (call 1) (call 1) (call 1)
      (call 1) (call 1) (call 1) (call 1) (call 1
      ... ; Add calls to exceed typical stack limits
    )
    (func (param i32))
  )
  "stack overflow"
)