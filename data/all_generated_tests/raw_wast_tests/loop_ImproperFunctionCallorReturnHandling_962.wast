;; Design a loop containing a `call` instruction followed by a `br_if` instruction. The loop should branch back if the function call returns a specific value, testing whether the function call's return value influences the loop execution correctly and that branching instructions handle this correctly.

(assert_invalid
  (module
    (func $test_loop_with_call_and_br_if (param i32) (result i32)
      (local i32)
      (loop (result i32)
        (local.set 0 (call $dummy_func (local.get 0)))
        (br_if 0 (i32.eq (local.get 0) (i32.const 1)))
      )
    )
    (func $dummy_func (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)