;; 4. Test Description: Construct a scenario where a `br` instruction in a function incorrectly bypasses a `call_indirect` and jumps to the end of a block. This checks for proper function call validation before and after the branch.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (result i32) (i32.const 42))
    (func (block
      (call_indirect (type $t) (i32.const 0))
      (br 0)
    ))
  )
  "malformed call_indirect"
)