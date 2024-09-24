;; 4. **Test Description**:    - Set up a `br_if` instruction that controls the flow, leading either to a `call_indirect` using a proper index or to an out-of-bounds index. This tests `br_if`'s condition evaluation for requiring valid indices and trapping otherwise.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $test-func (param i32) (result i32)
      (local.get 0)
    )
    (elem (i32.const 0) $test-func)
    (func $main-func (param i32) (result i32)
      (local.get 0)
      (i32.const 1)
      (br_if 0)
      (i32.const 2)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "invalid function index"
)