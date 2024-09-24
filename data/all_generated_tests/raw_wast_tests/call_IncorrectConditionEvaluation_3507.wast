;; - Create nested function calls within a single function, using the `call` instruction multiple times. Verify stack state management and type correctness when functions return from nested calls.

(assert_invalid
  (module
    (type $type0 (func (param i32) (result i32)))
    (func $nested_call_1 (result i32)
      i32.const 1
      call $nested_call_2
    )
    (func $nested_call_2 (param i32) (result i32)
      i32.const 2
      call $nested_call_3
    )
    (func $nested_call_3 (param i32) (result i32)
      i32.const 3
      drop
    )
    (func (export "main")
      (call $nested_call_1)
      drop
    )
  )
  "type mismatch"
)