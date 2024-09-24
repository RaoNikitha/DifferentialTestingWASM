;; Test 9: Use an unreachable instruction within a try-catch block involving an imported function call. Verify exception handling mirrors across implementations.

(assert_invalid
  (module 
    (import "env" "external_func" (func $external_func (result i32)))
    (func (try (result i32) 
      (do 
        (unreachable) 
        (call $external_func)
      )
    ))
  )
  "unreachable instruction causing control flow interruption"
)