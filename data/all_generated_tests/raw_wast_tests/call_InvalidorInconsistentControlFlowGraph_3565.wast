;; Test 4: Create a function that has branches, where one branch leads to a valid function call and another to an invalid function index. This assesses whether the CFG correctly differentiates between reachable and unreachable code paths based on the function index and properly triggers errors for the invalid branch.

(assert_invalid
  (module
    (func $branching
      (if (i32.const 1)
        (then (call 0))
        (else (call 1000))))
    (func))
  "unknown function"
)