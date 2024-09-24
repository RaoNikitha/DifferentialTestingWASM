;; 1.  *Test Description*: Check how an imported function from another module handles a branch to a loop label that doesn’t exist in the callee module.     *Constraint Being Checked*: Ensures the control transfer correctly recognizes and handles invalid branch targets across module boundaries, preventing stack corruption.

(assert_invalid
  (module
    (import "env" "external_func" (func))
    (func
      (call 0)
      (block 
        (loop
          (br 2)
        )
      )
    )
  )
  "unknown label"
)