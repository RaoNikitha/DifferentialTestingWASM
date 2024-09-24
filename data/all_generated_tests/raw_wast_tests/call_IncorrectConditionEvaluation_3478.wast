;; Test 7: Set up a test where a function makes multiple calls to another function that alternates the condition value between true and false. Use `br_if` at each alternation point to decide whether to branch or not.

(assert_invalid
  (module
    (func $callee (param $p i32) (result i32)
      (local.get $p)
      (if (result i32)
        (i32.eqz)
        (then (i32.const 1))
        (else (i32.const 0))
      )
    )
    (func (param i32) (result i32)
      (local.get 0)
      (call $callee)
      (local.set 1)
      (block
        (local.get 1)
        (br_if 0)
        (call $callee (i32.const 0))
      )
    )
  )
  "type mismatch"
)