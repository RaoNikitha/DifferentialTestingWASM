;; 3. **Empty Stack Trap**:    Design a module in which the `call_indirect` instruction is invoked without pushing sufficient arguments onto the stack. The execution should hit an `unreachable` instruction, ensuring that improper stack state is detected and trapped accurately.

(assert_invalid
  (module
    (type $t (func (param i32 f64) (result f64)))
    (table 1 funcref)
    (func $missing_args
      (call_indirect (type $t) (i32.const 0))
    )
  )
  "type mismatch"
)