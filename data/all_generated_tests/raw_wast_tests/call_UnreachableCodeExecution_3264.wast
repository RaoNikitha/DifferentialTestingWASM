;; Test 3: Design a function that dynamically selects a function index to call based on input. The function index should point to an invalid function, producing an 'unreachable' instruction trap.

(assert_invalid
  (module
    (func $dynamic-call 
      (param $x i32)
      (call_indirect (param i32) (result i32)
        (local.get $x) (i32.const 999)
      )
    )
    (table 1 funcref)
  )
  "unreachable instruction trap"
)