;; - **Test 9**: Structure a test where the type of the stack after a `br` instruction must satisfy a function `call`, but ensure a mismatch (`i64` instead of expected `f32`) to force stack type checks across breaks.

(assert_invalid
  (module
    (func $dummy) 
    (func $test
      (i32.const 0)
      (br 0)
      (call $dummy)
    )
    (type $sig (func (param f32)))
    (func $type-mismatch (call $test (f32.const 0.0)))
  )
  "type mismatch"
)