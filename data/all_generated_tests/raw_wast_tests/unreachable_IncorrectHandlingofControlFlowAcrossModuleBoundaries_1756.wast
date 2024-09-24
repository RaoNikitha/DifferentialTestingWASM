;; 7. **Test 7: `unreachable` Instruction in Exported Recursive Function**    - Description: Define a recursive function in a module that calls itself and contains an `unreachable` instruction in certain code branches. Import and call this function from the main module.    - Constraint Checked: Ensures proper handling of recursion and traps when control flow recurses back into a module containing `unreachable`.    - Relation: Verifies recursive calls transitioning through module boundaries handle traps correctly.

(assert_invalid
  (module
    (func $recursive (export "recursive") (param i32)
      (local.get 0)
      (if (i32.eqz)             ;; Check if the parameter is zero
        (then (unreachable))    ;; Trap immediately if zero
        (else (call $recursive) ;; Recursive call with the same parameter
      )
    ))
    (start $recursive)
    (func (param i32) (unreachable))
  )
  "type mismatch"
)