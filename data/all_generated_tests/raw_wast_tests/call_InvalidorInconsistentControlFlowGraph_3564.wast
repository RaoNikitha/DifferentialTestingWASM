;; Test 3: Develop a test case where a loop structure is present, and inside the loop, a function is called with an index that becomes invalid after several iterations. This checks if the CFG can handle dynamic changes in the validity of the function index and if error handling is consistently applied.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $inc (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.add
    )
    (func (param i32) (result i32)
      (local i32)
      local.get 0
      i32.const 5
      i32.lt_s
      (if (result i32)
        (then
          local.get 0
          (call $inc)
          call 1  ;; Invalid function index after several iterations
        )
        (else
          i32.const 0
        )
      )
    )
  )
  "invalid function index"
)