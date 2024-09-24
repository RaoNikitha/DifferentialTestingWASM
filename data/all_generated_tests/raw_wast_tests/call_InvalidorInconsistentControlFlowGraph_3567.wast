;; Test 6: Implement a case where a function index is dynamically calculated based on certain conditions (e.g., modulo operation), resulting in an invalid index in some scenarios. This verifies if the CFG can handle conditional indexing and orchestrate proper error handling mechanisms.

(assert_invalid
  (module
    (func $calculated-func-idx
      (local $temp i32)
      (i32.const 5)
      (i32.const 3)
      (i32.rem_s)
      (local.set $temp)
      (call_indirect (type 0) (local.get $temp))
    )
    (type (func (param)))
    (table 0 funcref)
  )
  "unknown function"
)