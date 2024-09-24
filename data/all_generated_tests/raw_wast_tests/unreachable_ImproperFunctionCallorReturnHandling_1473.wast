;; 4. **Test 4: Call Indirect with Unreachable Target**    - Description: Use a `call_indirect` instruction where the target function contains an `unreachable` instruction.      - *Constraint:* Confirms the trap from the target function prevents any return.      - *Improper Handling Check:* Validates proper handling of indirect calls leading to `unreachable`.

(assert_invalid
  (module
    (type $t (func))
    (table funcref (elem 0))
    (func $target (unreachable))
    (elem (i32.const 0) $target)
    (func (result i32)
      (call_indirect (type $t) (i32.const 0))
      (i32.const 1)
    )
  ) 
  "call_indirect type mismatch"
)