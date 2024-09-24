;; Test 9: Create a setup where `call_indirect` is used to call a function within a loop, where the function itself performs conditional checks to exit the loop. Ensure that a signature mismatch forces the loop's condition to always be false, never breaking the loop.

(assert_invalid
  (module
    (type $sig-loop (func (param i32) (result i32)))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32)
      (i32.eqz (local.get 0))
      (if (result i32)
        (i32.const 1)
        (i32.const 0)
      )
    )
    (func $loop-func (param i32)
      (local.get 0)
      (block
        (loop $loop
          (i32.const 0)
          (call_indirect (type $sig) (i32.const 0))
          (br_if $loop)
        )
      )
    )
  )
  "type mismatch"
)