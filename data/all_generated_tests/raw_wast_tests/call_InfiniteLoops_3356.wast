;; 5. Establish a loop that repeatedly calls a series of functions based on indices. Insert an invalid function index on one of the calls to check if the loop runs indefinitely in `wizard_engine` due to the lack of proper error handling, unlike WebAssembly implementation.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $valid_func_1 (param i32) (result i32)
      (i32.add (get_local 0) (i32.const 1))
    )
    (func $valid_func_2 (param i32) (result i32)
      (i32.mul (get_local 0) (i32.const 2))
    )
    (func $loop_func (param i32) (result i32)
      (loop $loop
        (call $valid_func_1 (get_local 0))
        (call $valid_func_2)
        (call 999 (get_local 0)) ;; Invalid function index
        (br $loop)
      )
    )
    (export "run" (func $loop_func))
  )
  "unknown function"
)