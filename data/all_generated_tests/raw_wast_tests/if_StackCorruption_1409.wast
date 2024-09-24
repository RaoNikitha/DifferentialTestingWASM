;; Design an `if` instruction where the `else` branch calls a function that exits through an exception, ensuring control flow correctly bubbles up and unwinds the stack, preserving the operand stack's state.

(assert_invalid
  (module (type $exc (func (result i32)))
    (func $throw (result i32) (i32.const 1) (throw $exc))
    (func $test (param i32) (result i32)
      (if (result i32) 
        (get_local 0) 
        (then (i32.const 42))
        (else (call $throw))
      )
    )
  )
  "unwinding stack with exception"
)