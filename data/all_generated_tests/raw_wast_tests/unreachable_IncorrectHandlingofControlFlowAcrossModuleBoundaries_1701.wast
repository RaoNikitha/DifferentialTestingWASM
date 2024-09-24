;; Test 2: Place an unreachable instruction inside a loop that calls an imported function. Verify if the loop exits correctly and handling of unreachable state within the loop scope.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (result i32)
      (loop 
        (unreachable)
        (call $external_func)
      )
    )
  )
  "unreachable"
)