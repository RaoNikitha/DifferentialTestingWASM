;; - Construct a test where the `call` instruction references a function index that is near the boundary of valid indices. Test for proper index validation and trap handling when an out-of-bounds index is called.

(assert_invalid
  (module
    (func (call 3))
    (func (param i32))
    (func (param i32))
  )
  "unknown function"
)