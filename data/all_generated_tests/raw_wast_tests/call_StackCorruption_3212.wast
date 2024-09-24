;; 1. Test a `call` instruction with a valid function index but incorrect number of arguments, ensuring the stack's initial and final state is validated for corruption.

(assert_invalid
  (module
    (type (func (param i32 i32))) 
    (func (type 0)) 
    (func (call 1 (i32.const 10))) 
  ) 
  "type mismatch"
)