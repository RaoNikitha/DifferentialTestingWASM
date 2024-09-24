;; Test 10: Valid Function With Incorrect CFG - **Constraint/Issue**: Checks if the control flow graph fails to account for paths after function calls. - **Test Description**: Create a function that has various paths including loops and branches. Call this function indirectly and ensure the results match expected paths. If there's any misalignment in the paths due to CFG issues, the test should demonstrate differing behavior between implementations.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $target1 (result i32) (if (result i32) (i32.const 1) (i32.const 2)))
    (func $target2 (param i32) (result i32) (i32.add (local.get 0) (i32.const 5)))
    (elem (i32.const 0) funcref (ref.func $target1) (ref.func $target2))
    (func $caller (result i32)
      (call_indirect (type 1) (i32.const 1) (i32.const 10)) ;; intended for $target2 expecting one param, but CFG issues
    )
  )
  "control flow graph issue"
)