;; Test 5: Generate a test where a function call is made to an index that indirectly references another invalid function index through multiple jumps. This checks the CFG’s ability to manage indirect calls and correctly identify and handle errors due to invalid references.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 10 funcref)
    (func $type-indirect-reference-invalid
      (call_indirect (type 0) (i32.const 3) (i32.const 1))
    )
  )
  "type mismatch"
)