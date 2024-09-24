;; 2. A test with a `loop` containing `nop` and an arithmetic operation that consumes an operand. Ensure the initial stack state is empty to produce a type mismatch.

(assert_invalid
  (module 
    (func (loop (nop i32.const 1 add)))
  )
  "type mismatch"
)