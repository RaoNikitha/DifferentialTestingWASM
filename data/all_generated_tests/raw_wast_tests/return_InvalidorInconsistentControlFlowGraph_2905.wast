;; 4. Develop a function with multiple branching instructions (`if`, `else`, and `return`) where one conditional branch has an extraneous stack value, and test WebAssembly’s response to stack validation against the Wizard Engine’s approach to unreachable code marking.

(assert_invalid
  (module
    (func $multiple-branching-with-return (result i32)
      (i32.const 1)
      (if (then
            (i32.const 2)
            (return)
          )
        (else
            (i32.const 3)
          )
      )
      (i32.const 4)
    )
  )
  "type mismatch"
)