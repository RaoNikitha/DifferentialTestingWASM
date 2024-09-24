;; Test 10: Create a case where the function index is passed as an argument to another function, which performs the call. This checks the CFG’s handling of function indices as arguments and ensures that errors are propagated properly when an invalid index is used.

(assert_invalid
  (module
    (func $invoke (param i32)
      (call_indirect (type 0) (get_local 0) (i32.const 1)))
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $invoke)
  )
  "uninitialized reference"
)