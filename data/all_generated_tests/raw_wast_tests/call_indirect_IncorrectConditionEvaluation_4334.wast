;; Create a test where the `call_indirect` instruction follows a `br_if` that always evaluates as true, ensuring the function is always called regardless of the actual condition.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $callee (param i32) (result i32)
      (local.get 0)
    )
    (table funcref (elem $callee))
    (func $test
      (i32.const 1)
      (br_if 0 (i32.const 1))
      (call_indirect (type $sig) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)