;; - Create a scenario where a `loop` includes a `call` to a function returning multiple results. Verify that the operand stack correctly manages and resumes loop execution after multiple return values.

(assert_invalid
  (module
    (type $multi_res (func (param i32) (result i32 i32)))
    (func $return_multi (param i32) (result i32 i32)
      (local.get 0) (local.get 0))
    (func
      (loop
        (call $return_multi (i32.const 1))
        (br 0)))
  )
  "type mismatch"
)