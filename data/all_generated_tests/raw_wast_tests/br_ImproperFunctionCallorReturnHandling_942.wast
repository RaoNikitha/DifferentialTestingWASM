;; 3. Structure a `block` containing a `call_indirect` instruction followed by a `br` to the outer loop's beginning. The aim is to check if the jump-back mishandles the function's return sequence, leading to function call interruption.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (result i32) (i32.const 42))
    (func $test
      (block (loop
        (call_indirect (type $t) (i32.const 0))
        (br 1)
      ))
    )
  )
  "type mismatch"
)