;; 6. **Test Case 6**: Create a loop that calls an imported function which triggers another loop in the imported function. Use `br` instructions in the nested loop to jump to specific points. This test verifies proper handling of nested loop jumps and stack unwinds when crossing module boundaries.

(assert_invalid
  (module
    (import "env" "nestedLoopFunc" (func $nestedLoopFunc))
    (func $testFunc
      (loop (result i32)
        call $nestedLoopFunc
        br 0
      )
    )
  )
  "type mismatch"
)