;; 2. Test a nested loop structure where a `br` instruction targets the outer loop, but the inner loop manipulates the stack such that the types of operands are incorrect when the `br` is executed. This will validate if the operand stack is correctly managed across nested loops, preventing type mismatches.

(assert_invalid
  (module
    (func $nested-loops-invalid-br
      (block $outer
        (loop $inner
          (br $outer)
          (i32.const 1) ;; Manipulate stack here
        )
      )
    )
  )
  "type mismatch"
)