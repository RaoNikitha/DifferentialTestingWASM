;; Test 8: Develop a recursive function that inadvertently calls itself with an invalid index after a few recursions. This ensures that the CFG can correctly manage recursion depth and handle errors occurring after several recursion levels.

(assert_invalid
  (module
    (func $recursiveFunc (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      (local.get 0)
      (i32.const 5)
      i32.lt_s
      if (result i32)
        (call $recursiveFunc (local.get 0))
      else
        (call 9999) ;; Invalid function index after few recursions
      end
    )
    (func (export "main") (result i32)
      i32.const 1
      (call $recursiveFunc)
    )
  )
  "unknown function"
)