;; Test 5: Design a function that conditionally calls another function with `call_indirect` inside a loop, where the function call should intermittently trigger a loop exit based on certain conditions. Ensure that signature mismatches prevent the loop from exiting, resulting in an infinite loop.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32)))
    (func $callee1 (type $sig1) (param i32) (result i32) (i32.const 0))
    (func $callee2 (type $sig2) (param i32))
    (table funcref (elem $callee1 $callee2))
    (func $test
      (loop $loop
        (if
          (i32.ne
            (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
            (i32.const 0)
          )
          (then
            br $loop
          )
        )
        (call_indirect (type $sig2) (i32.const 1) (i32.const 0))  ;; Should trap due to signature mismatch
      )
    )
  )
  "type mismatch"
)