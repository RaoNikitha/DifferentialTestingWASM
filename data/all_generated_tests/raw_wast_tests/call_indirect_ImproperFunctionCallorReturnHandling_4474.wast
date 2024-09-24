;; 3. Provide a `call_indirect` instruction with an incorrect number of arguments on the operand stack, resulting in a mismatch with the function's arguments. In OCaml, this should cause a trap due to incorrect pattern matching, while Java should fail during the check or argument popping phase.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $incorrect-args-stack (call_indirect (type 0) (i32.const 0) (i32.const 42) (i32.const 7)))
  )
  "type mismatch"
)