;; 2. **Test Description:**    Form a nested conditional structure containing `unreachable` within the `else` branch of the deepest conditional and use a `br` instruction targeting an outer block, ensuring proper context switching.    *Constraint Checked:* Context verification that `unreachable` interrupts the innermost conditional branch only.    *Mismanagement Focus:* Identify incorrect flow control where `unreachable` potentially affects outside conditions improperly.

(assert_invalid
  (module (func (block (block (br 1) (if (i32.const 0) (then) (else (unreachable))))
  (i32.const 1)))
  "type mismatch"
))