;; 7. **Test 7: Function Call with Local Variables in Inner Block**      Description: Create a function having local variables set inside an inner block and call another function that consumes these locals. The test checks local variable handling and argument transfer from inner blocks to function calls.      Constraint: Variables must be heavily used and modified in complex expressions.      Relation to Branch Target Resolution: Transfer of local variables across block boundaries affects control flow and branch targets.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $innerFunc (param i32) (result i32)
      (local i32)
      (local.set 1 (i32.add (local.get 0) (i32.const 1)))
      (local.get 1)
    )
    (func $outerFunc (result i32)
      (local i32)
      (block
        (local.set 0 (i32.const 5))
        (local.set 0 (i32.add (local.get 0) (i32.const 3)))
        (call $innerFunc (local.get 0))
      )
    )
    (call $outerFunc)
  )
  "type mismatch"
)