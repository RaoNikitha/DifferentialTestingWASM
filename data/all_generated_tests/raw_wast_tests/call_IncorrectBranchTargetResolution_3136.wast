;; 5. **Test Description**:    - Create a recursive function `F1` with a base case and a recursive case.    - Use a `call` to another function `F2` inside both cases of the recursion.    - Add branches that exit the recursion based on calculated conditions before and after the `call` to `F2`.    - **Constraint Checked**: Verify correct handling of recursion with branching around function calls.    - **Incorrect Branch Target Resolution**: Incorrect branch handling in recursion may lead to infinite loops or missing recursive calls.

(assert_invalid
 (module
  (func $F2 (param i32))
  (func $F1 (param i32)
   (block $exit
    (if (i32.eqz (local.get 0))
     (then
      (call $F2 (local.get 0))
      (br $exit)
     )
    )
    (call $F2 (local.get 0))
    (call $F1 (i32.sub (local.get 0) (i32.const 1)))
   )
  )
 )
 "type mismatch"
)