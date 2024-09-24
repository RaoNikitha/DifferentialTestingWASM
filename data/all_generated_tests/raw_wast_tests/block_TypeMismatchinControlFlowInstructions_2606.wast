;; Test 7: Define a block where the `blocktype` uses `typeidx`, referring to a function type that mismatches the actual operand and result types processed within the block. This tests whether `typeidx` is properly enforced and handled relative to the block type.

(assert_invalid
  (module (type $t (func (param i32) (result i32))) (func (result i32) (block (type $t) (f64.const 1.0))))
  "type mismatch"
)