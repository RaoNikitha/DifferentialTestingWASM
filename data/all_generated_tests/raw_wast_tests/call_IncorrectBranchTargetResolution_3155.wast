;; Test 4: Create a module using the `loop` construct with internal `br` instructions calling functions. Check for scenarios where branching targets incorrectly due to a mismatch in label resolution carried into the called functions.

(assert_invalid
  (module
    (func $testLoopAndBr
      (loop 
        (br 1)
        (call 0)
      )
    )
    (func (param i32))
  )
  "unknown label"
)