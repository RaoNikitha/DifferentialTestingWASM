;; 6. **Test of Loop with Early Exit and Call:**    - Create a loop in module A with `br` to an outer block for early exit, and call an imported function from module B after the `br` instruction. The objective is to verify that the stack is correctly unwound and the loop and block control behave properly before and after the function call.    - **Constraint Checked:** Proper handling of loops and early exit control flow with cross-module function calls.    - **Relation to Constraint:** Ensures loop structures execute correctly with `br` and cross-module function invocation.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (param i32)))
    (func
      (block
        (loop
          (br 1)
          (call $externalFunc (i32.const 42))
        )
      )
    )
  )
  "unknown label"
)