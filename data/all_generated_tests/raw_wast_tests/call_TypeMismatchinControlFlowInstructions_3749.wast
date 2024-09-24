;; 8. **Invalid Type in Multi-Value Return Block**:    Design a block that is supposed to return multiple values (`i32`, `f32`) but calls a function that returns (`i32`, `i32`). Check if the type mismatch is properly identified and reported.

(assert_invalid
  (module
    (type $sig_incorrect_return (func (result i32 i32)))
    (type $expected_return (func (result i32 f32)))
    (func $return_incorrect (type $sig_incorrect_return) (i32.const 42) (i32.const 24))
    (func $test_multi_value
      (block (result i32 f32)
        (call $return_incorrect)
      )
    )
  )
  "type mismatch"
)