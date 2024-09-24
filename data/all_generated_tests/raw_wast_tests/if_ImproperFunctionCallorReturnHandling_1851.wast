;; 2. A test where the `then` block contains a `call_indirect` instruction with an incorrect function signature reference, while the `else` block performs a valid function call. This test aims to see if the incorrect `call_indirect` is properly caught and handled.

(assert_invalid
  (module
    (type $correct_sig (func (param i32) (result i32)))
    (type $incorrect_sig (func (param f32) (result i32)))
    (table funcref (elem 0))
    (func $valid_func (type $correct_sig) (param i32) (result i32)
      local.get 0
    )
    (func $test
      (if (result i32)
        (then
          (i32.const 0)
          (call_indirect (type $incorrect_sig) (i32.const 0) (f32.const 1.0))
        )
        (else
          (i32.const 2)
          (call_indirect (type $correct_sig) (i32.const 0) (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)