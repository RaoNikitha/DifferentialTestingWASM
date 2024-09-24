;; 9. **Test 9: `unreachable` in Complex Instruction Sequences**    - Complex sequences containing arithmetic/logic operations concluded abruptly by `unreachable`.    - Validates stack consistency and integrity checks when partway executed sequences are interrupted.    - Assesses whether all intermediate results are correctly discarded, and no stack corruption occurs.

(assert_invalid
  (module (func $complex-sequence-after-unreachable
    (i32.const 42) 
    (i32.add (i32.const 1) (i32.const 2)) 
    (unreachable) 
    (i64.const 0) 
    (i32.eqz)
  ))
  "type mismatch"
)