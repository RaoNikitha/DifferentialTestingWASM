;; Test 1: Create a function call to an invalid function index that is just beyond the valid range. This tests the error handling of the lookup mechanism by checking if an appropriate error message is generated for an out-of-bounds function index. If the CFG improperly handles the exception, the test will expose this discrepancy.

(assert_invalid
  (module
    (func (call 1))
    (func)
  )
  "undefined function index"
)