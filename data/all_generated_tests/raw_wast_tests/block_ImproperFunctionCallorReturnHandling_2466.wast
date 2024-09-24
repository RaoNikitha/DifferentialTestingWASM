;; - Test 7: Craft a block with a `call_indirect` instruction where the function index is out of bounds or points to an invalid type, checking whether the implementation correctly handles invalid indirect call targets.

(assert_invalid
  (module
    (type $sig (func))
    (table 1 anyfunc)
    (func (block (call_indirect (type $sig) (i32.const 1))))
  )
  "call_indirect type mismatch"
)