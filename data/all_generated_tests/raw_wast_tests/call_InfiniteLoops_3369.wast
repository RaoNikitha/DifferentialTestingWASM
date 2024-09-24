;; Test 8: Design a loop that calls a function containing another loop with its own "br_if" condition. Confirm that the nested loop respects the condition and properly exits, avoiding scenarios where type mismatches or incorrect stack operations lead to infinite loops.

(assert_invalid
  (module
    (type $nested_loop_type (func (param i32) (result i32)))
    (func $inner_loop (param i32) (result i32)
      (local $i i32)
      (local.set $i (local.get 0))
      (loop $inner
        (br_if $inner (i32.eq (local.get $i) (i32.const 0)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (br $inner)
      )
      (local.get $i)
    )
    (func $outer_loop (param i32) (result i32)
      (local $j i32)
      (local.set $j (local.get 0))
      (loop $outer
        (br_if $outer (i32.eq (local.get $j) (i32.const 0)))
        (call $inner_loop (local.get $j))
        (local.set $j (i32.sub (local.get $j) (i32.const 1)))
        (br $outer)
      )
      (local.get $j)
    )
    (func (export "test") (param i32) (result i32)
      (call $outer_loop (local.get 0))
    )
  )
  "type mismatch"
)