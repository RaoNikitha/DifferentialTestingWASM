;; Test 5: Utilize the unreachable instruction within an if-else control flow that involves calling an imported function. Ensure traps are consistent and verify if the condition evaluation is unaffected.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test
      (if (i32.const 0) 
        (then (unreachable) (call $external_func))
        (else (call $external_func))
      )
    )
  )
  "type mismatch"
)