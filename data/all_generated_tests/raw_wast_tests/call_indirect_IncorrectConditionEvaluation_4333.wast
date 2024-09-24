;; Test an out-of-bounds function index with `br_if` condition, verifying that the condition fails and an appropriate trap is triggered due to incorrect index evaluation.

(assert_invalid
  (module
    (type (func (result i32)))
    (table 1 funcref)
    (func (param i32)
      (block
        (br_if 0 (call_indirect (type 0) (local.get 0) (i32.const 999)))
      )
    )
  )
  "type mismatch"
)