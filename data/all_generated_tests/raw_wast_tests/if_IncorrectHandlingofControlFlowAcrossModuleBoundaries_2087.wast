;; 8. **Test Description:**    Develop a scenario with an `if` instruction that conditionally calls an imported function, and within that function, another `if` condition calls a function from the original module. This nested cross-module call tests for proper handling of multiple context switches and maintaining consistent stack and control flow across nested module boundaries.

(assert_invalid
  (module 
    (import "js" "func" (func $importedFunc))
    (func $originalFunc (result i32)
      (i32.const 1)
      (if (result i32)
          (call $importedFunc)
        (then (i32.const 42))
        (else (call $importedFunc))
      )
    )
    (func (result i32)
      (if (result i32)
          (i32.const 0)
        (then (call $originalFunc))
        (else (i32.const 43))
      )
    )
  )
  "type mismatch"
)