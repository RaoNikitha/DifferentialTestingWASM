;; Test 3: Create a scenario where a nested loop calls a function that triggers another loop. The called function should handle types correctly and avoid infinite loops caused by improper stack operations or context handling.

(assert_invalid
  (module
    (type $sig1 (func))
    (type $sig2 (func (param i32)))
    (func $nested-call (param i32)
      (loop
        (call $trigger-loop)
      )
    )
    (func $trigger-loop
      (loop
        (if (i32.const 1)
          (then 
            (call $nested-call (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)