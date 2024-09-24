;; - Test a `loop` containing a `br_if` instruction that should only branch if a value on the stack is non-zero. Push `0` onto the stack to ensure no branching occurs.

(assert_invalid
 (module
   (func $test-loop-br_if
     (i32.const 0)
     (loop (result i32)
       (br_if 0 (i32.const 0))
       (i32.const 1)
     )
   )
 )
 "type mismatch"
)